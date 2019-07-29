//
//  AlbumSearchViewController.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import AsyncDisplayKit

/**
 * MasterViewController
 * Displays all Albums/Movies under the iTunes Search API
 * Added Search Functionality
 * Default Params: term = "star", country = "au", media = "movie"
 **/
class MasterViewController: ASViewController<AlbumSearchNode> {
    var listSections = [ListDiffable]()
    var officialNode: AlbumSearchNode
    var albums: [DataModels.Album] = []
    var searchController = UISearchController(searchResultsController: nil)
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    init() {
        let model = HeaderModel(title: "Movies ♥", subTitle: nil)
        officialNode = AlbumSearchNode(data: model)
        super.init(node: officialNode)
        reloadData()
        setupListAdapter()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchMovies(query: URL.defaultTerm)
        setupNavigationBar()
        checking()
    }
    
    func checking() {
        let ud = UserDefaults.standard
        if let trackName = ud.string(forKey: Keys.lastSavedTrackName),
            let artwork100 = ud.string(forKey: Keys.lastSavedImageURL),
            let genre = ud.string(forKey: Keys.lastSavedGenre),
            let longDesc = ud.string(forKey: Keys.lastSavedLongDesc) {
            let price = ud.double(forKey: Keys.lastSavedPrice)
            let date = UserDefaults.standard.object(forKey: Keys.lastSavedDate) as? Date ?? Date()
            let album = DataModels.Album(trackName: trackName, artwork100: artwork100, price: price, genre: genre, longDescription: longDesc)
            let model = AlbumViewModel(album: album, lastVisitedDate: date, fromUserDefaults: true)
            let vc = DetailViewController(model: model)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Setup & Reload Methods
extension MasterViewController {
    /// Setup ListAdapter (IGListKit)
    fileprivate func setupListAdapter() {
        adapter.setASDKCollectionNode(officialNode.collectionNode)
        adapter.dataSource = self
    }
    /// Navigation Bar Items : Title
    /// Bonus: Wanted to Add a Search Functionality - a search api after all
    func setupNavigationBar() {
        title = officialNode.data.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        searchController.delegate = self
        searchController.searchBar.delegate = self
    }
    
    func reloadData() {
        var vms: [AlbumViewModel] = []
        albums.forEach { vms.append(AlbumViewModel(album: $0)) }
        listSections = vms as [ListDiffable]
        reloadAdapter()
    }
    
    func reloadAdapter() {
        DispatchQueue.main.async { [weak self] in
            self?.adapter.performUpdates(animated: true, completion: nil)
        }
    }
}

// MARK: - List Adapter Datasource, Fill in Data
extension MasterViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return listSections
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let model = object as? AlbumViewModel {
            let controller = AlbumSectionController(model: model)
            controller.delegate = self
            return controller
        }
        
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}


// MARK: - Section Controller Delegates
extension MasterViewController: AlbumSectionControllerDelegate {
    func albumSectionDidSelectItem(model: AlbumViewModel) {
        let vc = DetailViewController(model: model)
        model.saveToUserDefaults()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - API Calls : Search A Movie
extension MasterViewController {
    
    /// Search movies
    ///
    /// - Parameter query: Search Bar Text
    func searchMovies(query: String) {
        LoadingScreen.show()
        WebService.shared.getMovies(query: query) { [weak self](response) in
            guard let weakSelf = self else { return }
            
            if let err = response?.error {
                DispatchQueue.main.async {
                    LoadingScreen.hide()
                    print(err.localizedDescription)
                }
            } else {
                if let albums = response?.albums {
                    weakSelf.albums = albums
                    weakSelf.reloadData()
                    
                    DispatchQueue.main.async {
                        LoadingScreen.hide()
                        weakSelf.hideKeyboard()
                        weakSelf.searchController.isActive = false
                    }
                }
            }
        }
    }
}

//// MARK: - SearchBar Delegates
extension MasterViewController: UISearchControllerDelegate, UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchedText = searchBar.text {
            searchMovies(query: searchedText)
        }
    }
}

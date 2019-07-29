//
//  DetailViewController.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//
import AsyncDisplayKit


/**
 * DetaiViewController
 * Show a Detailed View of an Album/Movie
 * Some albums may not have a long description/price
 **/
class DetailViewController: ASViewController<AlbumSearchNode> {
    var listSections = [ListDiffable]()
    var officialNode: AlbumSearchNode

    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    var model: AlbumViewModel
    
    init(model: AlbumViewModel) {
        self.model = model
        let model = HeaderModel(title: "\(model.trackName)", subTitle: nil)
        officialNode = AlbumSearchNode(data: model)
        super.init(node: officialNode)
        loadSections()
        setupListAdapter()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Setup Methods
extension DetailViewController {
    func loadSections() {
        listSections = [model] as [ListDiffable]
    }
    
    /// Setup ListAdapter (IGListKit)
    fileprivate func setupListAdapter() {
        adapter.setASDKCollectionNode(officialNode.collectionNode)
        adapter.dataSource = self
    }
    
    /// Navigation Bar Items : Title
    func setupNavigationBar() {
        title = officialNode.data.title
        navigationItem.largeTitleDisplayMode = .never
    }

    
    func reloadAdapter() {
        DispatchQueue.main.async { [weak self] in
            self?.adapter.performUpdates(animated: true, completion: nil)
        }
    }
}

// MARK: - List Adapter Datasource, Fill in Data
extension DetailViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return listSections
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let model = object as? AlbumViewModel {
            let controller = AlbumDetailSectionController(model: model)
            return controller
        }
        
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

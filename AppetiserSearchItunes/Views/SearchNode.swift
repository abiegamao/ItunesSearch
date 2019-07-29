//
//  SearchNode.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import AsyncDisplayKit


/// Wrapping Search Node for Texture
class SearchNode: ASDisplayNode {
    var bar: UISearchBar? {
        return self.view as? UISearchBar
    }
    
    init(height: CGFloat) {
        super.init()
        self.setViewBlock { () -> UIView in
            let searchView: UISearchBar = .init(frame: .zero)
            searchView.placeholder = "Search an Album..."
            searchView.backgroundImage = nil
            searchView.backgroundColor = .darkGray
            searchView.searchBarStyle = .minimal
            return searchView
        }
        self.style.height = .init(unit: .points, value: height)
        self.backgroundColor = .white
    }
}

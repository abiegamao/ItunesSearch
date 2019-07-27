//
//  AlbumSectionController.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import Foundation
import AsyncDisplayKit


/// Delegate for Selection
protocol AlbumSectionControllerDelegate: class {
    func albumSectionDidSelectItem(model: AlbumViewModel)
}

/**
 * AlbumSectionController
 * Wrapper for AlbumCellNode
 * IGListKit
 **/
class AlbumSectionController: ListSectionController, ASSectionController {
    weak var delegate: AlbumSectionControllerDelegate?
    let model: AlbumViewModel
    
    init(model: AlbumViewModel) {
        self.model = model
        super.init()
    }
    
    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        return { [weak self] in
            guard let weakSelf = self else { return ASCellNode() }
            let node = AlbumCellNode(model: weakSelf.model)
            return node
        }
    }
    
    func nodeForItem(at index: Int) -> ASCellNode {
        return ASCellNode()
    }
    
    override func didSelectItem(at index: Int) {
        delegate?.albumSectionDidSelectItem(model: model)
    }
    
    //ASDK Replacement
    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }
}

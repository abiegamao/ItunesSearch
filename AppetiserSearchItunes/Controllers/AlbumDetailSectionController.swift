//
//  AlbumDetailSectionController.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import AsyncDisplayKit


/**
 * AlbumDetailSectionController
 * Wrapper for AlbumDetailCellNode, inherited as only nodes changed
 * IGListKit
 **/
class AlbumDetailSectionController: AlbumSectionController {
    override func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        return { [weak self] in
            guard let weakSelf = self else { return ASCellNode() }
            let node = AlbumDetailCellNode(model: weakSelf.model)
            return node
        }
    }
}


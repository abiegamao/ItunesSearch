//
//  GenericNode.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import AsyncDisplayKit

class AlbumSearchNode: ASDisplayNode {
    var data: HeaderModel
    lazy var collectionNode: ASCollectionNode = {
        let collectionNode = CustomCollectionNode(flowLayout: UICollectionViewFlowLayout())
        collectionNode.alwaysBounceVertical = true
        return collectionNode
    }()
    
    init(data: HeaderModel) {
        self.data = data
        super.init()
        addSubnode(collectionNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let nodeSize = constrainedSize.min
        collectionNode.style.width = ASDimensionMake(nodeSize.width)
        collectionNode.style.flexGrow = 1.0
        collectionNode.style.flexShrink = 1.0
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: collectionNode)
    }
}

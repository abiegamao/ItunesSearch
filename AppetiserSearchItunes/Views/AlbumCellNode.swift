//
//  AlbumCellNode.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import AsyncDisplayKit

class AlbumCellNode: ASCellNode {
    let model: AlbumViewModel
    
    private var imageNode: ASNetworkImageNode = {
        let imageNode = ASNetworkImageNode()
        imageNode.shouldRenderProgressImages = true
        imageNode.placeholderEnabled = true
        imageNode.placeholderFadeDuration = 1
        imageNode.contentMode = .scaleAspectFill
        imageNode.cornerRadius = 5.0
        imageNode.style.preferredSize = CGSize(width: 60, height: 60)
        return imageNode
    }()
    
    lazy var borderView: ASDisplayNode = {
        let view = ASDisplayNode()
        view.backgroundColor = UIColor.lightGray
        view.style.height = ASDimensionMake(1)
        return view
    }()
    
    let tractNameTextNode: ASTextNode = {
        let label = ASTextNode()
        label.maximumNumberOfLines = 0
        return label
    }()
    
    let priceTextNode: ASTextNode = {
        let label = ASTextNode()
        label.maximumNumberOfLines = 1
        return label
    }()
    
    let genreTextNode: ASTextNode = {
        let label = ASTextNode()
        label.maximumNumberOfLines = 1
        return label
    }()
    
    init(model: AlbumViewModel) {
        self.model = model
        super.init()
        initNodes()
    }
    
    func initNodes() {
        automaticallyManagesSubnodes = true
        tractNameTextNode.attributedText = model.trackNameAttributed()
        genreTextNode.attributedText = model.genreAttributed()
        priceTextNode.attributedText = model.priceAttributed()
        if let imageUrl = model.artworkURL {
            imageNode.url = imageUrl
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

        let textStack = ASStackLayoutSpec.vertical()
        textStack.children =  [tractNameTextNode, genreTextNode, priceTextNode]
        
        
        let imageTextStack = ASStackLayoutSpec.horizontal()
        imageTextStack.children = [imageNode, textStack]
        imageTextStack.spacing = Constraints.Spacing.standard
        
        let finalStack = ASStackLayoutSpec.vertical()
        finalStack.children = [ imageTextStack, borderView]
        finalStack.spacing = Constraints.Spacing.double
        return ASInsetLayoutSpec(insets: Constraints.Insets.doubleSquaRect, child: finalStack)
    }
}

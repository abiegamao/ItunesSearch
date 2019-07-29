//
//  AlbumCellNode.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import AsyncDisplayKit

// Cell Node for MasterViewController
class AlbumCellNode: ASCellNode {
    let model: AlbumViewModel
    
    var imageNode: ASNetworkImageNode = {
        let imageNode = ASNetworkImageNode()
        imageNode.shouldRenderProgressImages = true
        imageNode.placeholderEnabled = true
        imageNode.placeholderFadeDuration = 1
        imageNode.contentMode = .scaleAspectFill
        imageNode.cornerRadius = Corner.loud.radius
        imageNode.style.preferredSize = CGSize(width: 60, height: 60)
        imageNode.defaultImage = #imageLiteral(resourceName: "no-image")
        return imageNode
    }()
    
    lazy var borderView: ASDisplayNode = {
        let view = ASDisplayNode()
        view.backgroundColor = UIColor.darkWhite
        view.style.height = ASDimensionMake(1)
        return view
    }()
    
    let trackNameTextNode: ASTextNode = {
        let label = ASTextNode()
        label.maximumNumberOfLines = 0
        return label
    }()
    
    let priceTextNode: ASTextNode = {
        let label = ASTextNode()
        label.maximumNumberOfLines = 0
        return label
    }()
    
    let genreTextNode: ASTextNode = {
        let label = ASTextNode()
        label.maximumNumberOfLines = 0
        return label
    }()
    
    init(model: AlbumViewModel) {
        self.model = model
        super.init()
        initNodes()
    }
    
    func initNodes() {
        automaticallyManagesSubnodes = true
        trackNameTextNode.attributedText = model.trackNameAttributed()
        genreTextNode.attributedText = model.genreAttributed()
        priceTextNode.attributedText = model.priceAttributed()
        if let imageUrl = model.artwork100URL { // I would use the 60 size, but it looks ugly on Retina Devices such XS
            imageNode.url = imageUrl
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

        let textStack = ASStackLayoutSpec.vertical()
        textStack.children =  [trackNameTextNode, genreTextNode, priceTextNode]
        textStack.style.width = ASDimensionMake(constrainedSize.max.width - Constraints.Spacing.quad - 60)
        let imageTextStack = ASStackLayoutSpec.horizontal()
        imageTextStack.children = [imageNode, textStack]
        imageTextStack.spacing = Constraints.Spacing.standard
        let finalStack = ASStackLayoutSpec.vertical()
        finalStack.children = [ imageTextStack, borderView]
        finalStack.spacing = Constraints.Spacing.double
        return ASInsetLayoutSpec(insets: Constraints.Insets.doubleTriSquaRect, child: finalStack)
    }
}

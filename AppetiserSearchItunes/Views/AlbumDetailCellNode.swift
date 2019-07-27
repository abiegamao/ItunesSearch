//
//  AlbumDetailCellNode.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import AsyncDisplayKit

// -- Cell Node for DetailViewController
class AlbumDetailCellNode: AlbumCellNode {
    let longDescTextNode: ASTextNode = {
        let label = ASTextNode()
        label.maximumNumberOfLines = 0
        return label
    }()
    
    let lastVisitedTextNode: ASTextNode = {
        let label = ASTextNode()
        label.maximumNumberOfLines = 0
        return label
    }()
    
    override func initNodes() {
        super.initNodes()
        longDescTextNode.attributedText = model.longDescAttributed()
        trackNameTextNode.attributedText = model.trackNameAttributed(alignment: .center)
        genreTextNode.attributedText = model.genreAttributed(alignment: .center)
        priceTextNode.attributedText = model.priceAttributed(alignment: .center)
        lastVisitedTextNode.attributedText = model.lastVisitedDateAttributed()
        imageNode.style.preferredSize = CGSize(width: 100, height: 100) // Still Blurry on Retina Devices
        if let imageUrl = model.artwork100URL {
            imageNode.url = imageUrl
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let textStack = ASStackLayoutSpec.vertical()
        textStack.spacing = Constraints.Spacing.standard
        textStack.children =  [trackNameTextNode, genreTextNode, priceTextNode, longDescTextNode]
        let finalStack = ASStackLayoutSpec.vertical()
        finalStack.horizontalAlignment = .none
        let relativeLastVisited = ASRelativeLayoutSpec(horizontalPosition: .end, verticalPosition: .end, sizingOption: .minimumSize, child: lastVisitedTextNode)
        let relativeImage = ASRelativeLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: .minimumSize, child: imageNode)
        finalStack.children = [relativeImage, textStack, borderView, relativeLastVisited]
        finalStack.spacing = Constraints.Spacing.double
        return ASInsetLayoutSpec(insets: Constraints.Insets.doubleTriSquaRect, child: finalStack)
    }
}

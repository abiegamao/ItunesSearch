//
//  LoadingScreenNode.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import AsyncDisplayKit
import Lottie

class LoadingScreenNode: ASDisplayNode {
    private let loaderSize: CGSize = CGSize(width: 96, height: 96)
    
    private let loadingStyle: LoadingScreen.Style
    
    private var backgroundNode: ASDisplayNode!
    private var loaderNode: ASDisplayNode!
    
    init(style: LoadingScreen.Style) {
        self.loadingStyle = style
        super.init()
        initNodes()
    }
    
    private func initNodes() {
        let lottieName = loadingStyle.lottieName()
        let shadow = Shadow.below
        
        automaticallyManagesSubnodes = true
        backgroundColor = UIColor(white: 1, alpha: 0.33)
        
        backgroundNode = ASDisplayNode()
        backgroundNode.backgroundColor = UIColor(white: 1, alpha: 1)
        backgroundNode.cornerRadius = Corner.loud.radius
        backgroundNode.shadowColor = shadow.color
        backgroundNode.shadowOffset = shadow.offset
        backgroundNode.shadowRadius = shadow.radius
        backgroundNode.shadowOpacity = shadow.opacity
        
        loaderNode = ASDisplayNode(viewBlock: {
            
            let animView = AnimationView(name: lottieName)
            animView.contentMode = UIView.ContentMode.scaleAspectFill
            animView.loopMode = .loop
            //            animView.backgroundColor = .white
            animView.play()
            return animView
        })
        loaderNode.backgroundColor = .white
        loaderNode.style.minSize = loaderSize
        loaderNode.style.maxSize = loaderSize
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        switch loadingStyle {
        case .default:
            let loaderInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4), child: loaderNode)
            let loaderBackground = ASBackgroundLayoutSpec(child: loaderInset, background: backgroundNode)
            let relative = ASRelativeLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: .minimumSize, child: loaderBackground)
            return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: relative)
        }
    }
}

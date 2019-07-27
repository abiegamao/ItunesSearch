//
//  LoadingScreenViewController.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import AsyncDisplayKit

class LoadingScreenViewController: ASViewController<LoadingScreenNode> {
    private var animationDuration: TimeInterval = 0.3
    
    init(style: LoadingScreen.Style) {
        super.init(node: LoadingScreenNode(style: style))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alphaIn()
    }
    
    private func alphaIn() {
        UIView.animate(
            withDuration: animationDuration,
            delay: 0,
            options: UIView.AnimationOptions.curveEaseInOut,
            animations: { [weak self] in
                
                self?.view?.alpha = 1
                
            }, completion: nil
        )
    }
    
    func alphaOut(handler: @escaping () -> Void) {
        UIView.animate(
            withDuration: animationDuration,
            delay: 0,
            options: UIView.AnimationOptions.curveEaseInOut,
            animations: { [weak self] in
                
                self?.view?.alpha = 0
                
            }, completion: { (_) in
                
                handler()
                
        })
    }
}

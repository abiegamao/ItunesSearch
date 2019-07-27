//
//  LoadingScreen.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import UIKit
import SwiftyTimer
import Lottie

class LoadingScreen {
    private static let shared = LoadingScreen()
    private init() {}
    
    private var window: UIWindow?
    private var timerEnded: Bool = false
    private var hideCalled: Bool = false
    private var callback: (() -> Void)?
    
    enum Style {
        case `default`
        
        func lottieName() -> String {
            switch self {
            case .default:
                return "loadingJSON"
            }
        }
    }
}

extension LoadingScreen {
    /// default to 1 second
    static func show(minDuration: TimeInterval = 1, style: Style = .default) {
        DispatchQueue.main.async {
            if shared.window == nil {
                let minDuration = max(0.5, minDuration)
                
                let vc = LoadingScreenViewController(style: style)
                
                let awd = UIWindow(frame: UIScreen.main.bounds)
                awd.rootViewController = vc
                
                for window in UIApplication.shared.windows where awd.windowLevel < window.windowLevel {
                    awd.windowLevel = window.windowLevel + 1
                }
                
                awd.makeKeyAndVisible()
                
                shared.hideCalled = false
                shared.timerEnded = false
                shared.window = awd
                
                Timer.after(minDuration, {
                    
                    shared.timerEnded = true
                    reallyHide()
                })
            }
        }
    }
    
    static func hide(_ handler: (() -> Void)? = nil) {
        shared.hideCalled = true
        shared.callback = handler
        reallyHide()
    }
    
    private static func reallyHide() {
        DispatchQueue.main.async {
            guard shared.hideCalled && shared.timerEnded else { return }
            
            if let vc = shared.window?.rootViewController as? LoadingScreenViewController {
                vc.alphaOut {
                    
                    let cb = shared.callback
                    shared.window = nil
                    shared.callback = nil
                    cb?()
                }
            } else {
                let cb = shared.callback
                shared.window = nil
                shared.callback = nil
                cb?()
            }
        }
    }
}

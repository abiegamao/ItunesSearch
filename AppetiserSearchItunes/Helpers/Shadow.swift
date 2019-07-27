//
//  Shadow.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//
import UIKit

struct Shadow {
    var color: CGColor?
    var offset: CGSize
    var opacity: CGFloat
    var radius: CGFloat
    
    static let above = Shadow(
        color: UIColor(white: 0.1, alpha: 1).cgColor,
        offset: CGSize(width: 0, height: -2),
        opacity: 0.15,
        radius: 3
    )
    
    static let below = Shadow(
        color: UIColor(white: 0.1, alpha: 1).cgColor,
        offset: CGSize(width: 0, height: 2),
        opacity: 0.15,
        radius: 3
    )
    
    /// mainly used for transition
    static let transitionBelow = Shadow(
        color: UIColor(white: 0.1, alpha: 1).cgColor,
        offset: CGSize(width: 0, height: 4),
        opacity: 0.3,
        radius: 6
    )
    
    func pressed() -> Shadow {
        return Shadow(
            color: color,
            offset: CGSize(width: 0, height: 0),
            opacity: opacity * 0.75,
            radius: radius * 0.5
        )
    }
    
    /// height: 0...1, where 0 means no height, and 1 means normal height
    func adjustedHeight(_ height: CGFloat) -> Shadow {
        let pct = min(max(0, height), 1)
        return Shadow(
            color: color,
            offset: CGSize(width: offset.width * pct, height: offset.width * pct),
            opacity: opacity * pct,
            radius: radius * pct
        )
    }
    
    init(color: CGColor?, offset: CGSize, opacity: CGFloat, radius: CGFloat) {
        self.color = color
        self.offset = offset
        self.opacity = opacity
        self.radius = radius
    }
    
    init(layer: CALayer) {
        color = layer.shadowColor
        offset = layer.shadowOffset
        opacity = CGFloat(layer.shadowOpacity)
        radius = layer.shadowRadius
    }
}


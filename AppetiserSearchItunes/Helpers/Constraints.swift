//
//  Constraints.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import UIKit

struct Constraints {
    struct Sizing {
        /// 8
        static let standard = CGFloat(8)
        /// 4
        static let half = Sizing.standard * 0.5
        /// 12
        static let extra = Sizing.standard * 1.5
        
        // standard naming is based on short form of Cardinal prefixes - https://en.wikipedia.org/wiki/Numeral_prefix
        
        /// 16
        static let du = Sizing.standard * 2
        /// 24
        static let tri = Sizing.standard * 3
        /// 32
        static let quad = Sizing.standard * 4
        /// 40
        static let quin = Sizing.standard * 5
        /// 48
        static let sexa = Sizing.standard * 6
        /// 56
        static let septi = Sizing.standard * 7
        /// 64
        static let octo = Sizing.standard * 8
    }
    
    struct Spacing {
        /// 8
        static let standard = Sizing.standard
        /// 4
        static let half = Sizing.half
        /// 12
        static let extra = Sizing.extra
        /// 16
        static let double = Sizing.du
        /// 24
        static let triple = Sizing.tri
        /// 32
        static let quad = Sizing.quad
        /// 40
        static let quin = Sizing.quin
        /// 48
        static let sexa = Sizing.sexa
        /// 56
        static let septi = Sizing.septi
    }
    
    struct Insets {
        /// top: 8, left: 16, bottom: 8, right: 16
        static let standardHoriRect = UIEdgeInsets(top: Sizing.standard, left: Sizing.du, bottom: Sizing.standard, right: Sizing.du)
        /// top: 16, left: 8, bottom: 16, right: 8
        static let standardVertRect = UIEdgeInsets(top: Sizing.du, left: Sizing.standard, bottom: Sizing.du, right: Sizing.standard)
        /// top: 8, left: 8, bottom: 8, right: 8
        static let standardSquaRect = UIEdgeInsets(top: Sizing.standard, left: Sizing.standard, bottom: Sizing.standard, right: Sizing.standard)
        /// top: 4, left: 4, bottom: 4, right: 4
        static let halfSquaRect = UIEdgeInsets(top: Sizing.half, left: Sizing.half, bottom: Sizing.half, right: Sizing.half)
        /// top: 16, left: 16, bottom: 16, right: 16
        static let doubleSquaRect = UIEdgeInsets(top: Spacing.double, left: Spacing.double, bottom: Spacing.double, right: Spacing.double)
        /// top: 16, left: 24, bottom: 16, right: 24
        static let doubleTriSquaRect = UIEdgeInsets(top: Spacing.double, left: Spacing.triple, bottom: Spacing.double, right: Spacing.triple)
        /// top: 24, left: 24, bottom: 24, right: 24
        static let tripleSquaRect = UIEdgeInsets(top: Spacing.triple, left: Spacing.triple, bottom: Spacing.triple, right: Spacing.triple)
    }
}

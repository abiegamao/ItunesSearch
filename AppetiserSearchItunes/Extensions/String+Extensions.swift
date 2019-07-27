//
//  String+Extensions.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import UIKit

extension String {
    func attributed(font: UIFont?, size: CGFloat? = nil, color: UIColor = .black, alignment: NSTextAlignment = .left) -> NSAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = alignment
        let attr = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: size ?? UIFont.systemFontSize),
            NSAttributedString.Key.paragraphStyle: paragraph
        ]
        return NSAttributedString(string: self, attributes: attr)
    }
}


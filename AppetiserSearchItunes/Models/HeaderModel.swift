//
//  HeaderModel.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 29/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import UIKit

class HeaderModel: NSObject {
    var title: String
    var subTitle: String?
    
    init(title: String, subTitle: String? = nil) {
        self.title = title
        self.subTitle = subTitle
    }
}

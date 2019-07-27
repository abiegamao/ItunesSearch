//
//  Date+Extensions.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import Foundation

extension Date {
    /// 02/06/1980 10:00 PM
    var displayString: String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yy h:mm a"
        let now = dateformatter.string(from: self)
        return now
    }
}

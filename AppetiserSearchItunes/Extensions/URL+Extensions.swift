//
//  URL+Extensions.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import UIKit

// MARK: - iTunes URLs
extension URL {
    static var base: String {
        return "https://itunes.apple.com"
    }
    
    static var country: String {
        return "au"
    }
    
    static var media: String {
        return "movie"
    }
    
    static var defaultTerm: String {
        return "star"
    }
    
    static func searchMovies(query: String = defaultTerm) -> URL? {
        return URL(string: base + "/search?term=\(query)&amp;country=\(country);media=\(media);all")
    }
}

//
//  AlbumViewModel.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import UIKit

class AlbumViewModel: NSObject, SortOrderProtocol {
    let trackName: String
    let artwork: String
    let price: Double
    let genre: String
    var sortOrder: Int
    let album: DataModels.Album
    
    init(album: DataModels.Album, sortOrder: Int = 0) {
        self.album = album
        self.genre = album.primaryGenreName
        self.artwork = album.artworkUrl100
        self.trackName = album.trackName
        self.price = album.trackPrice
        self.sortOrder = sortOrder
    }
    
    func trackNameAttributed() -> NSAttributedString {
        return trackName.attributed(font: UIFont.systemFont(ofSize: 13), alignment: .left)
    }
    
    func genreAttributed() -> NSAttributedString {
        return genre.attributed(font: UIFont.systemFont(ofSize: 12), alignment: .left)
    }
    
    func priceAttributed() -> NSAttributedString {
        return "$\(price)".attributed(font: UIFont.systemFont(ofSize: 12), alignment: .left)
    }
    
    var artworkURL: URL? {
        return URL(string: artwork)
    }
}


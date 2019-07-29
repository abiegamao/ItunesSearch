//
//  AlbumViewModel.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import UIKit

class AlbumViewModel: NSObject {
    let trackName: String
    let artwork100: String
    let price: Double
    let genre: String
    let longDescription: String
    let album: DataModels.Album
    let lastVisitedDate: Date
    let fromUserDefaults: Bool
    
    init(album: DataModels.Album, lastVisitedDate: Date = Date(), fromUserDefaults: Bool = false) {
        self.album = album
        self.genre = album.primaryGenreName
        self.artwork100 = album.artworkUrl100
        self.trackName = album.trackName
        self.price = album.trackPrice
        self.longDescription = album.longDescription
        self.lastVisitedDate = lastVisitedDate
        self.fromUserDefaults = fromUserDefaults
    }

    func trackNameAttributed(alignment: NSTextAlignment = .left) -> NSAttributedString {
        return trackName.attributed(font: UIFont.systemFont(ofSize: 15), alignment: alignment)
    }
    
    func genreAttributed(alignment: NSTextAlignment = .left) -> NSAttributedString {
        return genre.attributed(font: UIFont.systemFont(ofSize: 14), alignment: alignment)
    }
    
    func priceAttributed(alignment: NSTextAlignment = .left) -> NSAttributedString {
        return "$\(price)".attributed(font: UIFont.systemFont(ofSize: 14), alignment: alignment)
    }
    
    func longDescAttributed(alignment: NSTextAlignment = .center) -> NSAttributedString {
        let str = longDescription.isEmpty ? "No Description Provided" : longDescription
        return str.attributed(font: UIFont.systemFont(ofSize: 14), alignment: alignment)
    }
    
    func lastVisitedDateAttributed(alignment: NSTextAlignment = .right) -> NSAttributedString? {
        if fromUserDefaults  {
            return "Last Visited: \(lastVisitedDate.displayString)".attributed(font: UIFont.systemFont(ofSize: 14),                                                              color: .gray, alignment: alignment)
        }
        return nil
    }
    
    var artwork100URL: URL? {
        return URL(string: artwork100)
    }
    
    func saveToUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(trackName, forKey: Keys.lastSavedTrackName)
        userDefaults.set(artwork100, forKey: Keys.lastSavedImageURL)
        userDefaults.set(genre, forKey: Keys.lastSavedGenre)
        userDefaults.set(price, forKey: Keys.lastSavedPrice)
        userDefaults.set(longDescription, forKey: Keys.lastSavedLongDesc)
        userDefaults.set(Date(), forKey: Keys.lastSavedDate)
    }
}


//
//  Album.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import Foundation

extension DataModels {
    class Album: Decodable {
        var artworkUrl100: String = ""
        var artworkUrl60: String = ""
        var collectionId: Int = 0
        var collectionName: String = ""
        var country: String = ""
        var trackPrice: Double = 0.0
        var trackName: String = ""
        var longDescription : String = ""
        var primaryGenreName: String = ""
        var releaseDate: String = ""
        
        enum CodingKeys: String, CodingKey {
            case artworkUrl100
            case artworkUrl60
            case collectionId
            case collectionName
            case country
            case primaryGenreName
            case releaseDate
            case trackName
            case trackPrice
            case longDescription
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            trackName = try container.decodeIfPresent(String.self, forKey: .trackName) ?? trackName
            artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? artworkUrl100
            artworkUrl60 = try container.decodeIfPresent(String.self, forKey: .artworkUrl60) ?? artworkUrl60
            collectionId = try container.decodeIfPresent(Int.self, forKey: .collectionId) ?? collectionId
            collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName) ?? collectionName
            country = try container.decodeIfPresent(String.self, forKey: .country) ?? country
            primaryGenreName = try container.decodeIfPresent(String.self, forKey: .primaryGenreName) ?? primaryGenreName
            releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? releaseDate
            longDescription = try container.decodeIfPresent(String.self, forKey: .longDescription) ?? longDescription
            trackPrice = try container.decodeIfPresent(Double.self, forKey: .trackPrice) ?? trackPrice
        }
    }
}

extension DataModels.Album {
    /// Wrapper for decoding data
    public static func decode(data: Data) ->  DataModels.Album? {
        struct Object: Decodable {
            let result: DataModels.Album
        }
        return DataModels.decode(Object.self, from: data)?.result ?? DataModels.decode(DataModels.Album.self, from: data)
    }
    
    /// Wrapper for decoding data in array
    public static func decodeArray(data: Data) -> [DataModels.Album]? {
        struct Object: Decodable {
            let results: [DataModels.Album]
        }
        return DataModels.decode(Object.self, from: data)?.results ?? DataModels.decode([DataModels.Album].self, from: data)
    }
}


//
//  Track.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 25/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import Foundation
extension DataModels {
    class Track: Decodable {
        var trackName: String = ""
        var trackNumber: Int = 0
        
        init(trackName: String, trackNumber: Int) {
            self.trackName = trackName
            self.trackNumber = trackNumber
        }
        
        enum CodingKeys: String, CodingKey {
            case trackName
            case trackNumber
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            trackName = try container.decodeIfPresent(String.self, forKey: .trackName) ?? trackName
            trackNumber = try container.decodeIfPresent(Int.self, forKey: .trackNumber) ?? trackNumber
        }
    }
}

extension DataModels.Track {
    /// Wrapper for decoding data
    public static func decode(data: Data) ->  DataModels.Track? {
        struct Object: Decodable {
            let result: DataModels.Track
        }
        return DataModels.decode(Object.self, from: data)?.result ?? DataModels.decode(DataModels.Track.self, from: data)
    }
    
    /// Wrapper for decoding data
    public static func decodeArray(data: Data) -> [ DataModels.Track]? {
        struct Object: Decodable {
            let results: [DataModels.Track]
        }
        return DataModels.decode(Object.self, from: data)?.results ?? DataModels.decode([DataModels.Track].self, from: data)
    }
}




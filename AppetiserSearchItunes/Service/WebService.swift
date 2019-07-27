//
//  DataService.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import Foundation

class WebService {
    static let shared = WebService()

    struct AlbumsResponse {
        let albums: [DataModels.Album]?
        let error: Error?
    }
}

extension WebService {
    func getMovies (query: String, completion: @escaping (AlbumsResponse?)->()) {
        let searchString = query.replacingOccurrences(of: " ", with: "+")
        if let url = URL.searchMovies(query: searchString) {
            let session = URLSession.shared
            
            session.dataTask(with: url) { (data, response, error) in
                if let rdata = data, let albums = DataModels.Album.decodeArray(data: rdata) {
                    completion(AlbumsResponse(albums: albums, error: nil))
                } else {
                    if let err = error{
                        completion(AlbumsResponse(albums: nil, error: err))
                    }
                }
                }.resume()
        }
        completion(nil)
    }
}


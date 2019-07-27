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
    
    struct TracksResponse {
        let tracks: [DataModels.Track]?
        let error: Error?
    }
}

extension WebService {
    func getMovies (query: String, completion: @escaping (AlbumsResponse)->()) {
        let url = URL.searchMovies(query: query)!
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
    
    func getAlbumTracks (collectionId: Int, completion: @escaping (TracksResponse) -> ()) {
        let url = URL.lookUpMovie(id: collectionId)!
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let rdata = data, let tracks = DataModels.Track.decodeArray(data: rdata) {
                completion(TracksResponse(tracks: tracks, error: nil))
            }
            
            if let err = error {
                completion(TracksResponse(tracks: nil, error: err))
            }
        }.resume()
    }
}


//
//  DataModels.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import Foundation

public class DataModels {
    /// Wrapper for JSONDecoder().decode(type, from: data)
    internal static func decode<T>(_ type: T.Type, from data: Data) -> T? where T: Decodable {
        return try? JSONDecoder().decode(type, from: data)
    }
}

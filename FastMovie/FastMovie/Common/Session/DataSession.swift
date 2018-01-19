//
//  DataSession.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 18/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct DataSession {

    static func saveGenres(genres: [Genre]) {
        let defaults = UserDefaults.standard
        let archived = NSKeyedArchiver.archivedData(withRootObject: genres)
        defaults.set(archived, forKey: String.Defaults.genresDefaults)
    }
    
    static func getGenres() -> [Genre] {
        let defaults = UserDefaults.standard
        guard let data = defaults.object(forKey: String.Defaults.genresDefaults) else {
            return []
        }
        return NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! [Genre]
    }
}

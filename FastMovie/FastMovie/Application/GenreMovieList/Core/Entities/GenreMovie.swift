//
//  GenreMovie.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenreMovie {
    let genreIds: [Int]
    let id: Int
    let releaseDate: String
    let posterUrl: URL
    let title: String
    let voteAverage: Float
    
    func getNamesGenres() -> String {
        let genres = DataSession.getGenres()
        
        var names: String = ""
        _ = genreIds.map { genreId in
            names.append((genres.first { (genre) -> Bool in
                return genre.id == genreId
                }?.name)! + ", ")
        }
        
        let namesFormatted = String(names.dropLast(2))
        
        return namesFormatted
    }
}

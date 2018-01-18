//
//  GenreMovie.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenreMovie {
    let adult: Bool
    let backdropURL: URL
    let genreIds: [Int]
    let id: Int
    let originalLanguege: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let posterUrl: URL
    let popularity: Float
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
    
    func getNamesGenres() -> String {
        let genres = DataSession.genres
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

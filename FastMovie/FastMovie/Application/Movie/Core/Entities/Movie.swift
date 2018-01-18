//
//  Movie.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct Movie {
    let adult: Bool
    let backdropPath: String
    let budget: Float
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imbdId: String
    let originalLanguege: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let popularity: Float
    let companies: [Companie]
    let countries: [Countrie]
    let releaseDate: String
    let revenue: Float
    let runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int

    struct Companie {
        let name: String
        let id: Int
    }
    
    struct Countrie {
        let iso: String
        let name: String
    }
    
    struct SpokenLanguage {
        let name: String
        let iso: String
    }
}

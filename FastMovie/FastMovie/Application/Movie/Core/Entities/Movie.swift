//
//  Movie.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct Movie {
    let backdropURL: URL
    let genres: [Genre]
    let overview: String
    let posterURL: URL
    let companies: [Companie]
    let countries: [Countrie]
    let releaseDate: String
    let title: String
    let voteAverage: Float

    func getNamesGenres() -> String {
        var names: String = ""
        _ = genres.map {
            names.append($0.name + ", ")
        }
        let namesFormatted = String(names.dropLast(2))
        return namesFormatted
    }
    
    func getNamesCompaies() -> String {
        var names: String = ""
        _ = companies.map {
            names.append($0.name + ", ")
        }
        let namesFormatted = String(names.dropLast(2))
        return namesFormatted
    }
    
    func getNamesCountries() -> String {
        var names: String = ""
        _ = countries.map {
            names.append($0.name + ", ")
        }
        let namesFormatted = String(names.dropLast(2))
        return namesFormatted
    }
    
    struct Companie {
        let name: String
        let id: Int
    }
    
    struct Countrie {
        let iso: String
        let name: String
    }
}

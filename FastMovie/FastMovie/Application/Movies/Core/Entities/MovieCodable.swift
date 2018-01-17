//
//  MovieCodable.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct MovieCodable: Codable {
    let adult: Bool
    let backdropPath: String
    let budget: Float
    let genres: [GenreCodable.GenreCodable]
    let homepage: String
    let id: Int
    let imbdId: String
    let originalLanguege: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let popularity: Float
    let companies: [CompanieCodable]
    let countries: [CountrieCodable]
    let releaseDate: String
    let revenue: Float
    let runtime: Int
    let spokenLanguages: [SpokenLanguageCodable]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case homepage
        case id
        case imbdId = "imdb_id"
        case originalLanguege = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case popularity
        case companies = "production_companies"
        case countries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount =  "vote_count"
    }
    
    
    struct CompanieCodable: Codable {
        let name: String
        let id: Int

    }

    struct CountrieCodable: Codable {
        let iso: String
        let name: String

        enum CodingKeys: String, CodingKey {
            case name
            case iso = "iso_3166_1"
        }
    }

    struct SpokenLanguageCodable: Codable {
        let name: String
        let iso: String

        enum CodingKeys: String, CodingKey {
            case name
            case iso = "iso_639_1"
        }
    }
}

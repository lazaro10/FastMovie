//
//  GenreMovieCodable.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenreMovieCodable: Codable {
    
    let id: Int
    let page: Int
    let results: [GenreMovieCodable]
    let total_pages: Int
    let total_results: Int

    struct GenreMovieCodable: Codable {
        let adult: Bool
        let backdropPath: String
        let genreIds: [Int]
        let id: Int
        let originalLanguege: String
        let originalTitle: String
        let overview: String
        let releaseDate: String
        let posterPath: String
        let popularity: Float
        let title: String
        let video: Bool
        let voteAverage: Float
        let voteCount: Int
        
        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case genreIds = "genre_ids"
            case id
            case originalLanguege = "original_language"
            case originalTitle = "original_title"
            case overview
            case releaseDate = "release_date"
            case posterPath = "poster_path"
            case popularity
            case title
            case video
            case voteAverage = "vote_average"
            case voteCount =  "vote_count"
        }
    }

}

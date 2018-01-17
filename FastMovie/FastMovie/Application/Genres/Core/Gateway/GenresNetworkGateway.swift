//
//  GenresNetworkGateway.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenresNetworkGateway: GenresGateway {

    private let getRequest: GetRequestable

    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }
    
    func genres(completionHandler: @escaping ((Result<[Genre], NetworkError>) -> Void)) {
        
        let fullURL = String.API.baseURL+"genre/movie/list?api_key="+String.API.apiKey
        getRequest.get(url: fullURL) { (data, error) in
            let result = GenerateResultObjectToArray<GenreCodable, Genre>(self.converterGenres).generate(data, error)
            completionHandler(result)
        }
    }
    
    private func converterGenres(entity: GenreCodable) -> [Genre] {
        return entity.genres.map({
            Genre(id: $0.id, name: $0.name)
        })
    }
    
    func movies(idGenre: Int, completionHandler: @escaping ((Result<[GenreMovie], NetworkError>) -> Void)) {
        let fullURL = String.API.baseURL+"genre/\(idGenre)/movies?api_key="+String.API.apiKey
        
        getRequest.get(url: fullURL) { (data, error) in
            let result = GenerateResultObjectToArray<GenreMovieCodable, GenreMovie>(self.converterMovies).generate(data, error)
            completionHandler(result)
        }
    }

    private func converterMovies(entity: GenreMovieCodable) -> [GenreMovie] { 
        return entity.results.map({
            GenreMovie(adult: $0.adult, backdropPath: $0.backdropPath, genreIds: $0.genreIds, id: $0.id, originalLanguege: $0.originalLanguege, originalTitle: $0.originalTitle, overview: $0.overview, releaseDate: $0.releaseDate, posterPath: $0.posterPath, popularity: $0.popularity, title: $0.title, video: $0.video
                , voteAverage: $0.voteAverage, voteCount: $0.voteCount)
        })
        
    }
}

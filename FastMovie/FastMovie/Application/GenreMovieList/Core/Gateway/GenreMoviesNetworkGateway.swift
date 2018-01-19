//
//  GenreMoviesNetworkGateway.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenreMoviesNetworkGateway: GenreMoviesGateway {
    private let getRequest: GetRequestable
    
    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
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
            GenreMovie(genreIds: $0.genreIds, id: $0.id, releaseDate: $0.releaseDate, posterUrl: URL(string: String.API.imageBaseURL+($0.posterPath ?? ""))!, title: $0.title, voteAverage: $0.voteAverage)
        })
    }
}

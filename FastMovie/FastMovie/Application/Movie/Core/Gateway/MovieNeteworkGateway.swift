//
//  MovieNeteworkGateway.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

class MovieNeteworkGateway: MovieGateway {
    
    private let getRequest: GetRequestable
    
    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }
    
    func movie(url: String, completionHandler: @escaping ((Result<Movie, NetworkError>) -> Void)) {
        getRequest.get(url: url) { (data, error) in
            let result = GenerateResultObjectToObject<MovieCodable, Movie>(self.converterMovie).generate(data, error)
            completionHandler(result)
        }
    }
    
    private func converterMovie(entity: MovieCodable) -> Movie {
        
        let genres = entity.genres.map {
            return Genre(id: $0.id, name: $0.name)
        }
    
        let companies = entity.companies.map {
            return Movie.Companie(name: $0.name, id: $0.id)
        }

        let countries = entity.countries.map {
            return Movie.Countrie(iso: $0.iso, name: $0.name)
        }
        
        return Movie(backdropURL: URL(string: String.API.imageBaseURL+(entity.backdropPath ?? ""))!, genres: genres, overview: entity.overview, posterURL: URL(string: String.API.imageBaseURL+(entity.posterPath ?? ""))!, companies: companies, countries: countries, releaseDate: entity.releaseDate, title: entity.title, voteAverage: entity.voteAverage)
    }
}

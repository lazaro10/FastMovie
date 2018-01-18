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
    
    func movie(id: Int, completionHandler: @escaping ((Result<Movie, NetworkError>) -> Void)) {
        let fullURL = String.API.baseURL+"movie/\(id)?api_key="+String.API.apiKey
        
        getRequest.get(url: fullURL) { (data, error) in
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

        let spokenLanguages = entity.spokenLanguages.map {
            return Movie.SpokenLanguage(name: $0.name, iso: $0.iso)
        }

        return Movie(adult: entity.adult, backdropPath: entity.backdropPath, budget: entity.budget, genres: genres, homepage: entity.homepage, id: entity.id, imbdId: entity.imbdId, originalLanguege: entity.originalLanguege, originalTitle: entity.originalTitle, overview: entity.overview, posterPath: entity.posterPath, popularity: entity.popularity, companies: companies, countries: countries, releaseDate: entity.releaseDate, revenue: entity.revenue, runtime: entity.runtime, spokenLanguages: spokenLanguages, status: entity.status, tagline: entity.tagline, title: entity.title, video: entity.video, voteAverage: entity.voteAverage, voteCount: entity.voteCount)
    }
}

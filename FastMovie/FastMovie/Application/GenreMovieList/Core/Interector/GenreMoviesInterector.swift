//
//  GenreMoviesInterector.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenreMoviesInterector {
    private let gateway: GenreMoviesGateway
    
    init(gateway: GenreMoviesGateway) {
        self.gateway = gateway
    }
    
    func fetchMovies(idGenre: Int, completion: @escaping CompletionHandler<[GenreMovie], NetworkError>) {
        
        gateway.movies(url: String.API.baseURL+"genre/\(idGenre)/movies?api_key="+String.API.apiKey) { (result) in
            completion(result)
        }
    }
    
}

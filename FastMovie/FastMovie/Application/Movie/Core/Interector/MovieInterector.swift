//
//  MovieInterector.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 18/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct MovieInterector {
    private let gateway: MovieGateway
    
    init(gateway: MovieGateway) {
        self.gateway = gateway
    }
    
    func fetchGenres(idMovie: Int, completion: @escaping CompletionHandler<Movie, NetworkError>) {
        gateway.movie(url: String.API.baseURL+"movie/\(idMovie)?api_key="+String.API.apiKey) { (result) in
            completion(result)
        }
    }
}

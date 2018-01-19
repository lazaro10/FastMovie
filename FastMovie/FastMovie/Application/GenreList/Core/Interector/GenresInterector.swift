//
//  GenresInterector.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenresInterector {
    
    private let gateway: GenresGateway
    
    init(gateway: GenresGateway) {
        self.gateway = gateway
    }
    
    func fetchGenres(completion: @escaping CompletionHandler<[Genre], NetworkError>) {
        gateway.genres(url: String.API.baseURL+"genre/movie/list?api_key="+String.API.apiKey, completionHandler: { (result) in
            switch result {
            case .success(let genres):
                DataSession.saveGenres(genres: genres)            default:
                break
            }
            completion(result)
        })
    }
    
}

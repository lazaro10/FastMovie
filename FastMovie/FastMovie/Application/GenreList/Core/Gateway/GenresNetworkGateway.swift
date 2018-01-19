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
    
    func genres(url: String, completionHandler: @escaping ((Result<[Genre], NetworkError>) -> Void)) {
        getRequest.get(url: url) { (data, error) in
            let result = GenerateResultObjectToArray<GenreCodable, Genre>(self.converterGenres).generate(data, error)
            completionHandler(result)
        }
    }
    
    private func converterGenres(entity: GenreCodable) -> [Genre] {
        return entity.genres.map({
            Genre(id: $0.id, name: $0.name)
        })
    }

}

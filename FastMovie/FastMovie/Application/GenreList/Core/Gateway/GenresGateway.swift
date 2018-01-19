//
//  GenresGateway.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

protocol GenresGateway {
    func genres(url: String, completionHandler: @escaping CompletionHandler<[Genre], NetworkError>)
}

//
//  GenreMoviesGateway.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

protocol GenreMoviesGateway {
    func movies(url: String, completionHandler: @escaping CompletionHandler<[GenreMovie], NetworkError>)
}

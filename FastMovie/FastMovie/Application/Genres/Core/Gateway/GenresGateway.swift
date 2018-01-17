//
//  GenresGateway.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

protocol GenresGateway {
    func genres(completionHandler: @escaping CompletionHandler<[Genre], NetworkError>)
    func movies(idGenre: Int, completionHandler: @escaping CompletionHandler<[GenreMovie], NetworkError>)
}

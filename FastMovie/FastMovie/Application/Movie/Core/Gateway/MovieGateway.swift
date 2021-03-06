//
//  MovieGateway.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

protocol MovieGateway {
    func movie(url: String, completionHandler: @escaping CompletionHandler<Movie, NetworkError>)
}

//
//  GenreMoviesGatewayMock.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

@testable import FastMovie
class GenreMoviesGatewayMock: GenreMoviesGateway {
    
    var completionHandlerResult: Result<[GenreMovie], NetworkError>!
    
    func movies(url: String, completionHandler: @escaping ((Result<[GenreMovie], NetworkError>) -> Void)) {
        completionHandler(completionHandlerResult)
    }
}

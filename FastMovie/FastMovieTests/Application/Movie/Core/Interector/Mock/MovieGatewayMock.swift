//
//  MovieGatewayMock.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

@testable import FastMovie

class MovieGatewayMock: MovieGateway {
    
    var completionHandlerResult: Result<Movie, NetworkError>!
    
    func movie(url: String, completionHandler: @escaping ((Result<Movie, NetworkError>) -> Void)) {
        completionHandler(completionHandlerResult)
    }
}

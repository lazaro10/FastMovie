//
//  GenresGatewayMock.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

@testable import FastMovie

class GenresGatewayMock: GenresGateway {
    
    var completionHandlerResult: Result<[Genre], NetworkError>!
    
    func genres(url: String, completionHandler: @escaping ((Result<[Genre], NetworkError>) -> Void)) {
        completionHandler(completionHandlerResult)
    }
}


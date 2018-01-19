//
//  GenreMoviesInterectorSpec.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import FastMovie
class GenreMoviesInterectorSpec: QuickSpec {
    
    override func spec() {
        describe("GenreMoviesInterectorSpec") {
            var interector: GenreMoviesInterector!
            let gatewayMock = GenreMoviesGatewayMock()
            
            beforeEach {
                interector = GenreMoviesInterector(gateway: gatewayMock)
            }
            context("When movies are called") {
                let genreMovie = GenreMovie(genreIds: [1,2], id: 1, releaseDate: "2017-06-05", posterUrl: URL.init(string: "www.fastshop.com.br")!, title: "Title", voteAverage: 5.0)
                let neteworkError = NetworkError.weakConnection
                
                it("Expect the correct result when the request fails") {
                    gatewayMock.completionHandlerResult = Result.fail(neteworkError)
                    
                    interector.fetchMovies(idGenre: 0, completion: { (result) in
                        switch result {
                        case .success(let genreMovies):
                            expect(genreMovies).to(beNil())
                        case .fail(let error):
                            expect(error).to(matchError(NetworkError.weakConnection))
                        }
                    })

                }
                
                it("Expect the correct result when the request success") {
                    gatewayMock.completionHandlerResult = Result.success([genreMovie])
                    
                    interector.fetchMovies(idGenre: 0, completion: { (result) in
                        switch result {
                        case .success(let genreMovies):
                            expect(genreMovies).notTo(beNil())
                        case .fail(let error):
                            expect(error).to(beNil())
                            
                        }
                    })
            
                }
            }
        }
        
    }
}

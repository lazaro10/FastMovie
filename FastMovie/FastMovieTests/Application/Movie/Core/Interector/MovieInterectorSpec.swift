//
//  MovieInterectorSpec.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import FastMovie
class MovieInterectorSpec: QuickSpec {
    
    override func spec() {
        describe("MovieInterectorSpec") {
            var interector: MovieInterector!
            let gatewayMock = MovieGatewayMock()
            
            beforeEach {
                interector = MovieInterector(gateway: gatewayMock)
            }
            
            context("When movie are called") {
                let movie = Movie(backdropURL: URL.init(string: "www.fastshop.com.br")!, genres: [], overview: "", posterURL: URL.init(string: "www.fastshop.com.br")!, companies: [], countries: [], releaseDate: "2017-06-05", title: "Title", voteAverage: 5.0)
                let neteworkError = NetworkError.weakConnection
                
                it("Expect the correct result when the request fails") {
                    gatewayMock.completionHandlerResult = Result.fail(neteworkError)
                    
                    interector.fetchGenres(idMovie: 0, completion: { (result) in
                        switch result {
                        case .success(let movie):
                            expect(movie).to(beNil())
                        case .fail(let error):
                            expect(error).to(matchError(NetworkError.weakConnection))
                        }
                    })
                    
                }
                
                it("Expect the correct result when the request success") {
                    gatewayMock.completionHandlerResult = Result.success(movie)

                    interector.fetchGenres(idMovie: 0, completion: { (result) in
                        switch result {
                        case .success(let movie):
                            expect(movie).notTo(beNil())
                            expect(movie.title).to(equal("Title"))
                        case .fail(let error):
                            expect(error).to(beNil())
                        }
                    })
                }
            }
        }
    }
}

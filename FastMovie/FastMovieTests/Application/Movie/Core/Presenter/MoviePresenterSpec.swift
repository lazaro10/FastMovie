//
//  MoviePresenterSpec.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import FastMovie

class MoviePresenterSpec: QuickSpec {
    
    override func spec() {
        
        describe("MoviePresenterSpec") {
            var presenter: MoviePresenter!
            var gatewayMock: MovieGatewayMock!
            var presentationMock: MoviePresentationMock!
            
            beforeEach {
                gatewayMock = MovieGatewayMock()
                presentationMock = MoviePresentationMock()
                presenter = MoviePresenter(interector: MovieInterector(gateway: gatewayMock), delegate: presentationMock)
            }
            
            context("When the movie are called") {
                it("Success") {
                    gatewayMock.completionHandlerResult = Result.success(Movie(backdropURL: URL.init(string: "www.fastshop.com.br")!, genres: [], overview: "", posterURL: URL.init(string: "www.fastshop.com.br")!, companies: [], countries: [], releaseDate: "2017-06-05", title: "Title", voteAverage: 5.0))
                    presenter.getMovie(idMovie: 1)
                    expect(presentationMock.calledOnLoading).to(equal(true))
                    expect(presentationMock.calledOffLoading).to(equal(true))
                    expect(presentationMock.calledOnMovie?.releaseDate).to(equal("2017-06-05"))
                    expect(presentationMock.calledOnError).to(beNil())
                }
                
                it("Fail") {
                    gatewayMock.completionHandlerResult = Result.fail(NetworkError.offline)
                    presenter.getMovie(idMovie: 1)
                    expect(presentationMock.calledOnLoading).to(equal(true))
                    expect(presentationMock.calledOffLoading).to(equal(true))
                    expect(presentationMock.calledOnMovie).to(beNil())
                    expect(presentationMock.calledOnError).to(matchError(NetworkError.offline))
                }
            }
            
        }
        
    }
}

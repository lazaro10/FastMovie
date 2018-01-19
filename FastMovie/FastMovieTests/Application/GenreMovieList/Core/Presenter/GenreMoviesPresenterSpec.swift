//
//  GenreMoviesPresenterSpec.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import FastMovie

class GenreMoviesPresenterSpec: QuickSpec {
    
    override func spec() {
        
        describe("GenreMoviesPresenterSpec") {
            var presenter: GenreMoviesPresenter!
            var gatewayMock: GenreMoviesGatewayMock!
            var presentationMock: GenreMoviesPresentationMock!
            
            beforeEach {
                gatewayMock = GenreMoviesGatewayMock()
                presentationMock = GenreMoviesPresentationMock()
                presenter = GenreMoviesPresenter(interector: GenreMoviesInterector(gateway: gatewayMock), delegate: presentationMock, coordinator: UIViewController())
            }
            
            context("When the genre movies are called") {
                it("Success") {
                    gatewayMock.completionHandlerResult = Result.success([GenreMovie(genreIds: [1,2], id: 1, releaseDate: "2017-06-05", posterUrl: URL.init(string: "www.fastshop.com.br")!, title: "Title", voteAverage: 5.0)])
                    presenter.getMovies(with: 0)
                    expect(presentationMock.calledOnLoading).to(equal(true))
                    expect(presentationMock.calledOffLoading).to(equal(true))
                    expect(presentationMock.calledOnGenreMovies?.first?.releaseDate).to(equal("2017-06-05"))
                    expect(presentationMock.calledOnError).to(beNil())
                }
                
                it("Fail") {
                    gatewayMock.completionHandlerResult = Result.fail(NetworkError.offline)
                    presenter.getMovies(with: 0)
                    expect(presentationMock.calledOnLoading).to(equal(true))
                    expect(presentationMock.calledOffLoading).to(equal(true))
                    expect(presentationMock.calledOnGenreMovies).to(beNil())
                    expect(presentationMock.calledOnError).to(matchError(NetworkError.offline))
                }
            }
        }
        
    }
}

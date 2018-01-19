//
//  GenresPresenterSpec.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import FastMovie

class GenresPresenterSpec: QuickSpec {
    override func spec() {
        describe("GenresPresenterSpec") {
            
            var presenter: GenresPresenter!
            var gatewayMock: GenresGatewayMock!
            var presentationMock: GenresPresentationMock!
            
            beforeEach {
                gatewayMock = GenresGatewayMock()
                presentationMock = GenresPresentationMock()
                presenter = GenresPresenter(interector: GenresInterector(gateway: gatewayMock), delegate: presentationMock, coordinator: UIViewController())
            }
            
            context("When the genres are called") {
                it("Success") {
                    gatewayMock.completionHandlerResult = Result.success([Genre(id: 25, name: "Action")])
                    presenter.getGenres()
                    expect(presentationMock.calledOnLoading).to(equal(true))
                    expect(presentationMock.calledOffLoading).to(equal(true))
                    expect(presentationMock.calledOnGenres?.first?.id).to(equal(25))
                    expect(presentationMock.calledOnError).to(beNil())
                }
                
                it("Fail") {
                    gatewayMock.completionHandlerResult = Result.fail(NetworkError.offline)
                    presenter.getGenres()
                    expect(presentationMock.calledOnLoading).to(equal(true))
                    expect(presentationMock.calledOffLoading).to(equal(true))
                    expect(presentationMock.calledOnGenres).to(beNil())
                    expect(presentationMock.calledOnError).to(matchError(NetworkError.offline))
                }
            }
        }
    }
}

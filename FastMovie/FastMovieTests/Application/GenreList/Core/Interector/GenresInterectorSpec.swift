//
//  GenresInterectorSpec.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import FastMovie
class GenresInterectorSpec: QuickSpec {
    
    override func spec() {
        describe("GenresInterectorSpec") {
            
            var interector: GenresInterector!
            let gatewayMock = GenresGatewayMock()
            
            beforeEach {
                interector = GenresInterector(gateway: gatewayMock)
            }
            
            context("When genres are called") {
                
                let genres = [Genre(id: 1, name: "Action"), Genre(id: 2, name: "Documentary"), Genre(id: 1, name: "Action")]
                let networkError = NetworkError.offline
                
                it("Should that the saved genres are correct") {
                    
                    gatewayMock.completionHandlerResult = Result.success(genres)
                    
                    interector.fetchGenres(completion: { (result) in
                        switch result {
                        case .success(let genres):
                            expect(genres.count).to(equal(3))
                            expect(genres.first?.name).to(equal("Action"))
                            expect(genres.first?.id).to(equal(1))
                        default:
                            break
                        }
                    })
                }
                
                it("Expect the correct result when the request fails") {
                    gatewayMock.completionHandlerResult = Result.fail(networkError)
                    
                    interector.fetchGenres(completion: { (result) in
                        switch result {
                        case .success(let genres):
                            expect(genres).to(beNil())
                        case .fail(let error):
                            expect(error).to(matchError(NetworkError.offline))
                        }
                    })
                }
                
                it("Expect the correct result when the request success") {
                    gatewayMock.completionHandlerResult = Result.success(genres)
                    
                    interector.fetchGenres(completion: { (result) in
                        interector.fetchGenres(completion: { (result) in
                            switch result {
                            case .success(let genres):
                                expect(genres).notTo(beNil())
                            case .fail(let error):
                                expect(error).to(beNil())
                                
                            }
                        })
                    })
                }
                
            }
        }
    }
}

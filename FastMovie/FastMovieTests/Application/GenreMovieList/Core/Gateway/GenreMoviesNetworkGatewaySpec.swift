//
//  GenreMoviesNetworkGatewaySpec.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation
import Quick
import Nimble
import OHHTTPStubs

@testable import FastMovie

class GenreMoviesNetworkGatewaySpec: QuickSpec {
    override func spec() {
        describe("GenreMoviesNetworkGatewaySpec") {
            var gateway: GenreMoviesGateway!
            let host = "fastshop.com.br"
            let fakeApiPath = "https://\(host)/"
            
            beforeEach {
                gateway = GenreMoviesNetworkGatewayFactory.make()
            }
            
            context("Get Genres") {
                let bundle = Bundle(for: GenreMoviesNetworkGatewaySpec.self)
                it("Should return a list of movies when the server response is a json object"){
                    
                    stub(condition: isHost(host), response: { (request) -> OHHTTPStubsResponse in
                        let fixturePath = bundle.path(forResource: "GenreMovies", ofType: "json")!
                        return fixture(filePath: fixturePath, status: 200, headers: nil)
                    })
                    
                    var genreMovies: [GenreMovie]?
                    
                    gateway.movies(url: fakeApiPath, completionHandler: { (result) in
                        switch result {
                        case .success(let genreMoviesResult):
                            genreMovies = genreMoviesResult
                        default:
                            break
                        }
                    })
                    
                    expect(genreMovies?.count).toEventually(equal(3))
                    expect(genreMovies?.first?.id).toEventually(equal(460793))
                    expect(genreMovies?.first?.title).toEventually(equal("Olaf's Frozen Adventure"))
            }
            
                it("Should return an error when server response returns empty") {
                    
                    stub(condition: isHost(host), response: { (request) -> OHHTTPStubsResponse in
                        let fixturePath = bundle.path(forResource: "Empty", ofType: "json")!
                        return fixture(filePath: fixturePath, status: 200, headers: nil)
                    })
                    
                    var error: NetworkError?
                    gateway.movies(url: fakeApiPath, completionHandler: { (result) in
                        switch result {
                        case .fail(let errorResult):
                            error = errorResult
                        default:
                            break
                        }
                    })
                    
                    expect(error).toEventuallyNot(beNil())
                    expect(error).toEventually(matchError(NetworkError.mapping))
                }
                
                it("Should return an error when server response fails") {
                    stub(condition: isHost(host), response: { (request) -> OHHTTPStubsResponse in
                        return OHHTTPStubsResponse(data:Data(), statusCode: 504, headers: nil)
                            .responseTime(OHHTTPStubsDownloadSpeed1KBPS)
                    })
                    
                    var error: NetworkError?
                    gateway.movies(url: fakeApiPath, completionHandler: { (result) in
                        switch result {
                        case .fail(let errorResult):
                            error = errorResult
                        default:
                            break
                        }
                    })
                    expect(error).toEventuallyNot(beNil())
                }
            }
            
            
        }
        
    }
}

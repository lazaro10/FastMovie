//
//  MovieNetworkGatewaySpec.swift
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

class MovieNetworkGatewaySpec: QuickSpec {
    override func spec() {
        describe("MovieNetworkGatewaySpec") {
            var gateway: MovieGateway!
            let host = "fastshop.com.br"
            let fakeApiPath = "https://\(host)/"
            
            beforeEach {
                gateway = MovieNetworkGatewayFactory.make()
            }
            
            context("Get Movie") {
                let bundle = Bundle(for: MovieNetworkGatewaySpec.self)
                it("Should return a movie when the server response is a json object"){
                    
                    stub(condition: isHost(host), response: { (request) -> OHHTTPStubsResponse in
                        let fixturePath = bundle.path(forResource: "Movie", ofType: "json")!
                        return fixture(filePath: fixturePath, status: 200, headers: nil)
                    })
                    
                    var movie: Movie?
                    
                    gateway.movie(url: fakeApiPath, completionHandler: { (result) in
                        switch result {
                        case .success(let movieResult):
                            movie = movieResult
                        default:
                            break
                        }
                    })
                    
                    expect(movie).toEventuallyNot(beNil())
                    expect(movie?.releaseDate).toEventually(equal("2017-10-27"))
                    expect(movie?.title).toEventually(equal("Olaf's Frozen Adventure"))
                }
                
                it("Should return an error when server response returns empty") {
                    
                    stub(condition: isHost(host), response: { (request) -> OHHTTPStubsResponse in
                        let fixturePath = bundle.path(forResource: "Empty", ofType: "json")!
                        return fixture(filePath: fixturePath, status: 200, headers: nil)
                    })
                    
                    var error: NetworkError?
                    gateway.movie(url: fakeApiPath, completionHandler: { (result) in
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
                    gateway.movie(url: fakeApiPath, completionHandler: { (result) in
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

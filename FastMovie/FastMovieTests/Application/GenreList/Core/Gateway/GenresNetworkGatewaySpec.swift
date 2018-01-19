//
//  GenresNetworkGatewaySpec.swift
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
class GenresNetworkGatewaySpec: QuickSpec {
    override func spec() {
        describe("GenresNetworkGatewaySpec") {
            var gateway: GenresGateway!
            let host = "fastshop.com.br"
            let fakeApiPath = "https://\(host)/"
            beforeEach {
                gateway = GenresNetworkGatewayFactory.make()
            }
            context("Get Genres") {
                let bundle = Bundle(for: GenresNetworkGatewaySpec.self)
                it("Should return a list of genres when the server response is a json object"){
                    
                    stub(condition: isHost(host), response: { (request) -> OHHTTPStubsResponse in
                        let fixturePath = bundle.path(forResource: "Genres", ofType: "json")!
                        return fixture(filePath: fixturePath, status: 200, headers: nil)
                    })
                    
                    var genres: [Genre]?
                    gateway.genres(url: fakeApiPath, completionHandler: { (result) in
                        switch result {
                        case .success(let genresResult):
                            genres = genresResult
                        default:
                            break
                        }
                        
                    })
                    expect(genres?.count).toEventually(equal(8))
                    expect(genres?.first?.name).toEventually(equal("Action"))
                    expect(genres?.first?.id).toEventually(equal(28))
                }
                
                it("Should return an error when server response returns empty") {
                    
                    stub(condition: isHost(host), response: { (request) -> OHHTTPStubsResponse in
                        let fixturePath = bundle.path(forResource: "Empty", ofType: "json")!
                        return fixture(filePath: fixturePath, status: 200, headers: nil)
                    })
                    
                    var error: NetworkError?
                    gateway.genres(url: fakeApiPath, completionHandler: { (result) in
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
                    gateway.genres(url: fakeApiPath, completionHandler: { (result) in
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

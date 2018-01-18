//
//  MovieNeteworkGatewayFake.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct MovieNeteworkGatewayFake {
    static func make() -> MovieGateway {
        return MovieNeteworkGateway(getRequest: GetRequestFactory.make())
    }
}

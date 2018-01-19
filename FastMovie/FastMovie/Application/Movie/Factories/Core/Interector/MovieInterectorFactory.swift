//
//  MovieInterectorFactory.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 18/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct MovieInterectorFactory {
    static func make() -> MovieInterector {
        return MovieInterector(gateway: MovieNeteworkGatewayFactory.make())
    }
}

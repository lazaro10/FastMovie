
//
//  GenreMoviesInterectorFactory.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenreMoviesInterectorFactory {
    static func make() -> GenreMoviesInterector {
        return GenreMoviesInterector(gateway: GenreMoviesNetworkGatewayFactory.make())
    }
}

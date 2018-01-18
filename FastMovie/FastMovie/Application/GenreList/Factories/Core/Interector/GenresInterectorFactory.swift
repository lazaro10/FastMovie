//
//  GenresInterectorFactory.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenresInterectorFactory {
    static func make() -> GenresInterector {
        return GenresInterector(gateway: GenresNetworkGatewayFactory.make())
    }
}

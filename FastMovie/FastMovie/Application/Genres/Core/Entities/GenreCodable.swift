//
//  GenreCodable.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenreCodable: Codable {
    let genres: [GenreCodable]
    struct GenreCodable: Codable {
        let id: Int
        let name: String
    }
}

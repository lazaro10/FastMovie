//
//  GetRequestFactory.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

struct GetRequestFactory {
    static func make() -> GetRequestable {
        return GetRequest()
    }
}

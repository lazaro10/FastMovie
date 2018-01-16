//
//  ResponseConverter.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 15/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Alamofire

class ResponseConverter<T> {
    open func convert(_ response: Json) throws -> T {
        preconditionFailure("This method must be overriden")
    }
}

//
//  ErrorConverter.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 15/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct ErrorConverter {
    func convert(_ statusCode: Int) -> NetworkError {
        switch statusCode {
        case 401:
            return .unauthorized
        case 404:
            return .unexpected
        case 504:
            return .timeout
        case 502: 
            return .noConnection
        case 999:
            return .modelMapping
        default:
            return .unexpected
        }
    }
}

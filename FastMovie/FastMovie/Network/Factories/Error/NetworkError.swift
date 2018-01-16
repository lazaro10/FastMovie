//
//  NetworkError.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

enum NetworkError: Error {
    case mapping
    case weakConnection
    case offline
    case other(Error?)
    
    var localizedDescription: String {
        switch self {
        case .mapping:
            return String.NetworkError.mapping
        case .offline:
            return String.NetworkError.offline
        default:
            return String.NetworkError.other
        }
    }
    
    var rawValue: Int {
        switch self {
        case .mapping:
            return 1
        case .offline:
            return 2
        default:
            return 3
        }
    }
}

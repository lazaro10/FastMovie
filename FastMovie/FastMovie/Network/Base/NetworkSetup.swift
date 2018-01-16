//
//  NetworkSetup.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 15/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Alamofire

protocol NetworkSetup { }

extension NetworkError {
    var needsAccessToken: Bool { return true }
    var path: String { return "" }
    var parameters: [String: Any]? { return nil }
    var sampleData: Data { return Data() }
}


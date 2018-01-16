//
//  BaseNetwork.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 15/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Alamofire

protocol BaseNetwork {
    associatedtype Setup: NetworkSetup
    var errorConverter: ErrorConverter { get }
}

extension BaseNetwork {
    
    var errorConverter: ErrorConverter { return ErrorConverter() }
    
    func handle<T>(result: DataResponse<Any>, converter: ResponseConverter<T>, completion: @escaping (Result<Any>) -> Void) {
        
        if let statusCode = result.response?.statusCode, let value = result.result.value, let json = Json(json: value)  {
            switch statusCode {
            case 200...299:
                do {
                let model = try converter.convert(json)
                    completion(.success(model))
                } catch {
                   completion(.error(errorConverter.convert(999)))
                }
            default:
                completion(.error(errorConverter.convert(statusCode)))
            }
        } else {
            completion(.error(errorConverter.convert(0)))
        }
    }
}

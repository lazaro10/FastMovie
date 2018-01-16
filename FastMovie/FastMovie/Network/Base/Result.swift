//
//  Result.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 15/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

enum Result<T> {
    case success(T)
    case error(NetworkError)
}

//
//  Result.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

enum Result<T, E> where E: Error {
    case success(T)
    case fail(E)
}


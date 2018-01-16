//
//  CompletionHandler.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

typealias CompletionHandler<T, E: Error> = ((Result<T, E>) -> Void)

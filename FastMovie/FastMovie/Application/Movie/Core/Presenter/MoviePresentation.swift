//
//  MoviePresentation.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 18/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

protocol MoviePresentation: class {
    func onLoading()
    func offLoading()
    func onError(error: NetworkError)
    func onMovie(movie: Movie)
}

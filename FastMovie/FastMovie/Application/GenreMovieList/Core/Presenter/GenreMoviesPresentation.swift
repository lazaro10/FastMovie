//
//  GenreMoviesPresentation.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

protocol GenreMoviesPresentation: class {
    func onLoading()
    func offLoading()
    func onError(error: NetworkError)
    func onMovies(movies: [GenreMovie])
}


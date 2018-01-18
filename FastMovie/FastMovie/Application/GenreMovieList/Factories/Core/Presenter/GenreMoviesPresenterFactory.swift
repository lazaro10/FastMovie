//
//  GenreMoviesPresenterFactory.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct GenreMoviesPresenterFactory {
    static func make(delegate: GenreMoviesPresentation) -> GenreMoviesPresenter {
        return GenreMoviesPresenter(delegate: delegate)
    }
}

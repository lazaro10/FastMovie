//
//  MoviePresenterFactory.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 18/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct MoviePresenterFactory {
    static func make(delegate: MoviePresentation) -> MoviePresenter {
        return MoviePresenter(delegate: delegate)
    }
}

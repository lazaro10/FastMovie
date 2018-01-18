//
//  GenresPresentation.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

protocol GenresPresentation: class {
    func onLoading()
    func offLoading()
    func onError(error: NetworkError)
    func onGenres(genres: [Genre])
}

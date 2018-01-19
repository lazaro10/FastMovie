//
//  GenresPresentationMock.swift
//  FastMovieTests
//
//  Created by Lázaro Lima dos Santos on 19/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

@testable import FastMovie

class GenresPresentationMock: GenresPresentation {
    var calledOnLoading: Bool = false
    var calledOffLoading: Bool = false
    var calledOnError: NetworkError? = nil
    var calledOnGenres: [Genre]? = nil
    
    func onLoading() {
        calledOnLoading = true
    }
    
    func offLoading() {
        calledOffLoading = true
    }
    
    func onError(error: NetworkError) {
        calledOnError = error
    }
    
    func onGenres(genres: [Genre]) {
        calledOnGenres = genres
    }
}

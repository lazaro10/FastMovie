//
//  MoviePresenter.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 18/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

final class MoviePresenter {
    
    private weak var delegate: MoviePresentation?
    private lazy var interector: MovieInterector = MovieInterectorFactory.make()
    
    init(delegate: MoviePresentation) {
        self.delegate = delegate
    }
    
    func getMovie(idMovie: Int) {
        delegate?.onLoading()
        interector.fetchGenres(idMovie: idMovie) { [weak self] (result) in
            guard let delegate = self?.delegate else {
                return
            }
            switch result {
            case . success(let movie):
                delegate.onMovie(movie: movie)
            case .fail(let error):
                delegate.onError(error: error)
            }
            delegate.offLoading()
        }
        
        
    }
}

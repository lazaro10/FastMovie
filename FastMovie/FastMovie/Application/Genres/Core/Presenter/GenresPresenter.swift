//
//  GenresPresenter.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

final class GenresPresenter {
    
    private weak var delegate: GenresPresentation?
    private lazy var interector: GenresInterector = GenresInterectorFactory.make()
    
    init(delegate: GenresPresentation) {
        self.delegate = delegate
    }
    
    func getGenres() {
        interector.fetchGenres { [weak self] result in
            guard let delegate = self?.delegate else {
                fatalError("Delegate not instance")
            }
            delegate.onLoading()
            switch result {
            case .success(let genres):
                delegate.onGenres(genres: genres)
            case .fail(let error):
                delegate.onError(error: error)
            }
            delegate.offLoading()
        }
    }
}

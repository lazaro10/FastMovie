//
//  GenreMoviesPresenter.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

final class GenreMoviesPresenter {
    
    private weak var delegate: GenreMoviesPresentation?
    private lazy var interector: GenreMoviesInterector = GenreMoviesInterectorFactory.make()
    private let coordinator: SceneCoordinatorType
    
    init(delegate: GenreMoviesPresentation, coordinator: UIViewController) {
        self.delegate = delegate
        self.coordinator = SceneCoordinator(currentViewController: coordinator)
    }
    
    func getMovies(with idGenres: Int) {
        interector.fetchMovies(idGenre: idGenres) { [weak self] result in
            guard let delegate = self?.delegate else {
                fatalError("Delegate not instance")
            }
            delegate.onLoading()
            switch result {
            case .success(let movies):
                delegate.onMovies(movies: movies)
            case .fail(let error):
                delegate.onError(error: error)
            }
            delegate.offLoading()
        }
    }
    
    func showMovieDetail(idMovie: Int) {
        self.coordinator.transition(.push(animated: true), to: Scene.movie(idMovie))
    }
}

//
//  GenresPresenter.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

final class GenresPresenter {
    
    private weak var delegate: GenresPresentation?
    private lazy var interector: GenresInterector = GenresInterectorFactory.make()
    private let coordinator: SceneCoordinatorType
    
    init(delegate: GenresPresentation, coordinator: UIViewController) {
        self.delegate = delegate
        self.coordinator = SceneCoordinator(currentViewController: coordinator)
    }
    
    func getGenres() {
        delegate?.onLoading()
        interector.fetchGenres { [weak self] result in
            guard let delegate = self?.delegate else {
                return
            }
            switch result {
            case .success(let genres):
                delegate.onGenres(genres: genres)
            case .fail(let error):
                delegate.onError(error: error)
            }
            delegate.offLoading()
        }
    }
    
    func showGenresMovie(idGenre: Int) {
        self.coordinator.transition(.push(animated: true), to: Scene.genreMovieList(idGenre))
    }
}

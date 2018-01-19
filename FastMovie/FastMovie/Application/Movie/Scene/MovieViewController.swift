//
//  MovieViewController.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit
import Kingfisher
import SVProgressHUD

class MovieViewController: UIViewController {
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UITextView!
    @IBOutlet weak var productionCompaniesLabel: UILabel!
    @IBOutlet weak var productionCountriesLabel: UILabel!
    @IBOutlet weak var emptyStateView: UIView!
    fileprivate var movieId: Int!
    
    fileprivate lazy var presenter: MoviePresenter = MoviePresenterFactory.make(delegate: self)
    private var movie: Movie? {
        didSet {
            guard let movie = movie else {
                return
            }
            configureView(movie: movie)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        assertDependencies()
        presenter.getMovie(idMovie: movieId)
    }
    
    private func configureView(movie: Movie) {
        backdropImageView.kf.setImage(with: movie.backdropURL, placeholder: #imageLiteral(resourceName: "backdrop_placeholder"))
        posterImageView.kf.setImage(with: movie.posterURL, placeholder: #imageLiteral(resourceName: "placar_placeholder"))
        titleLabel.text = movie.title
        genresLabel.text = movie.getNamesGenres()
        releaseDateLabel.text = movie.releaseDate
        voteAverageLabel.text = "\(movie.voteAverage)"
        overviewLabel.text = movie.overview
        productionCompaniesLabel.text = movie.getNamesCompaies()
        productionCountriesLabel.text = movie.getNamesCountries()
    }

}

extension MovieViewController: MoviePresentation {
    
    func onMovie(movie: Movie) {
        self.movie = movie
    }
    
    func onError(error: NetworkError) {
        ErrorManager().handle(error, on: self) {
            self.presenter.getMovie(idMovie: self.movieId)
        }
    }
    
    func onLoading() {
        SVProgressHUD.show()
        emptyStateView.alpha = 1.0
    }
    
    func offLoading() {
        SVProgressHUD.dismiss()
        emptyStateView.alpha = 0.0
    }
    
}

extension MovieViewController: Injectable {
    
    func inject(_ movieId: Int) {
        self.movieId = movieId
    }
    
    func assertDependencies() {
        assert(movieId != nil)
    }
}

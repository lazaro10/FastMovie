//
//  GenreMovieListViewController.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit
import SVProgressHUD

class GenreMovieListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var genreId: Int!
    
    private var dataSource: CollectionDataSource<GenreMovieCollectionViewCell, GenreMovie>!
    fileprivate lazy var presenter: GenreMoviesPresenter = GenreMoviesPresenterFactory.make(delegate: self)
    private var movies: [GenreMovie] = [] {
        didSet {
            setDataSource(movies: movies)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        assertDependencies()
        configureCollection()
        presenter.getMovies(with: genreId)
    }

    private func configureCollection() {
        collectionView.register(UINib.init(nibName: GenreMovieCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: GenreMovieCollectionViewCell.identifier)
    }
    
    private func setDataSource(movies: [GenreMovie]) {
        DispatchQueue.main.async {
            self.dataSource = CollectionDataSource(items: movies)
            self.collectionView.dataSource = self.dataSource
            self.collectionView.reloadData()
        }
    }
}

extension GenreMovieListViewController: GenreMoviesPresentation {
    func onMovies(movies: [GenreMovie]) {
        self.movies = movies
    }
    
    func onError(error: NetworkError) {
        ErrorManager().handle(error, on: self) {
            self.presenter.getMovies(with: self.genreId)
        }
    }
    
    func onLoading() {
         collectionView.isHidden = true
        SVProgressHUD.show()
    }
    
    func offLoading() {
        collectionView.isHidden = false
        SVProgressHUD.dismiss()
    }
}

extension GenreMovieListViewController: Injectable {
    
    func inject(_ genreId: Int) {
        self.genreId = genreId
    }
    
    func assertDependencies() {
        assert(genreId != nil)
    }
}

//
//  GenreMovieListViewController.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class GenreMovieListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var genreId: Int!

    override func viewWillAppear(_ animated: Bool) {
        assertDependencies()
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

//
//  MovieViewController.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    fileprivate var movieId: Int!
    
    override func viewWillAppear(_ animated: Bool) {
        assertDependencies()
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

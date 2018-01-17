//
//  GenreListTableViewController.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class GenreListTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate lazy var presenter: GenresPresenter = GenresPresenterFactory.make(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getGenres()
    }

}

extension GenreListTableViewController: GenresPresentation {
    
    func onGenres(genres: [Genre]) {
        
    }
    
    func onError(error: NetworkError) {
        
    }
    
    func onLoading() {
        
    }
    
    func offLoading() {
        
    }
    
}

//
//  GenreListTableViewController.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class GenreListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var dataSource: TableDataSource<GenreTableViewCell, Genre>!
    fileprivate lazy var presenter: GenresPresenter = GenresPresenterFactory.make(delegate: self, coordinator: self.navigationController!)
    private var genres: [Genre] = [] {
        didSet {
            self.setDataSource(genres: genres)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        self.tableView.delegate = self
        presenter.getGenres()
    }
    
    private func configureTable() {
        tableView.register(UINib(nibName: GenreTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: GenreTableViewCell.identifier)
        tableView.rowHeight = GenreTableViewCell.height
    }
    
    private func setDataSource(genres: [Genre]) {
        DispatchQueue.main.async {
            self.dataSource = TableDataSource(items: genres)
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }

}

extension GenreListViewController: GenresPresentation {
    
    func onGenres(genres: [Genre]) {
        self.genres = genres
    }
    
    func onError(error: NetworkError) {
        
    }
    
    func onLoading() {
        
    }
    
    func offLoading() {
        
    }
}

extension GenreListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showGenresMovie(idGenre: 16)
    }
}

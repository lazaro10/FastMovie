//
//  GenreListTableViewController.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit
import SVProgressHUD

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
        presenter.getGenres()
    }
    
    private func configureTable() {
        tableView.register(UINib(nibName: GenreTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: GenreTableViewCell.identifier)
    }
    
    private func setDataSource(genres: [Genre]) {
        DispatchQueue.main.async {
            self.dataSource = TableDataSource(items: genres)
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self
            self.tableView.reloadData()
        }
    }

}

extension GenreListViewController: GenresPresentation {
    
    func onGenres(genres: [Genre]) {
        self.genres = genres
    }
    
    func onError(error: NetworkError) {
        ErrorManager().handle(error, on: self) {
            self.presenter.getGenres()
        }
    }
    
    func onLoading() {
        SVProgressHUD.show()
        tableView.isHidden = true
    }
    
    func offLoading() {
        tableView.isHidden = false
        SVProgressHUD.dismiss()
    }
}

extension GenreListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showGenresMovie(idGenre: self.genres[indexPath.row].id)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

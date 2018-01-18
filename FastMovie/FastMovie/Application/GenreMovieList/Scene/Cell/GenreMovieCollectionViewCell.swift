//
//  GenreMovieCollectionViewCell.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit
import Kingfisher

class GenreMovieCollectionViewCell: UICollectionViewCell, Identifiable {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var genres: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        poster.kf.indicatorType = .activity
    }
    
    fileprivate var movie: GenreMovie? {
        didSet {
            guard let movie = movie else {
                return
            }
            poster.kf.setImage(with: movie.posterUrl)
            genres.text = movie.getNamesGenres()
            title.text = movie.title
            releaseDate.text = movie.releaseDate
            voteAverage.text = "\(movie.voteAverage)"
        }
    }
    

}

extension GenreMovieCollectionViewCell: ViewCellHandler {
    typealias Item = GenreMovie
    var data: Item? {
        get {
            return movie
        }
        set {
            movie = newValue
        }
    }
}

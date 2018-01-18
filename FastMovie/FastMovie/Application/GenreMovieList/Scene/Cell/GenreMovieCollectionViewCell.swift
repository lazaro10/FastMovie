//
//  GenreMovieCollectionViewCell.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class GenreMovieCollectionViewCell: UICollectionViewCell, Identifiable {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var genres: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    fileprivate var genreMovie: GenreMovie? {
        didSet {
            guard let genreMovie = genreMovie else {
                return
            }
            print(genreMovie)
        }
    }
    

}

extension GenreMovieCollectionViewCell: ViewCellHandler {
    typealias Item = GenreMovie
    var data: Item? {
        get {
            return genreMovie
        }
        set {
            genreMovie = newValue
        }
    }
}

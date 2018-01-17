//
//  GenreTableViewCell.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class GenreTableViewCell: UITableViewCell, Identifiable {

    static let height: CGFloat = 60.0
    
    @IBOutlet weak var tagImage: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    fileprivate var genre: Genre? {
        didSet {
            guard let genre = genre else {
                return
            }
            tagImage.backgroundColor = UIColor.randomColor()
            self.nameLabel.text = genre.name
        }
    }

}

extension GenreTableViewCell: ViewCellHandler {
    typealias Item = Genre
    var data: Item? {
        get {
            return genre
        }
        set {
            genre = newValue
        }
    }
}

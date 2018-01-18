//
//  Scene+SceneType.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

extension Scene: SceneType {
    
    var storyboardIdentifier: String {
        
        switch self {
        case .genreMovieList: return StoryboardIdentifier.genreMovieList
        case .movie: return StoryboardIdentifier.movie
        }
    }
    
    var viewController: UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let storyboardViewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier)
        
        switch self {
        case .genreMovieList(let genreId):

            guard let viewController = storyboardViewController as? GenreMovieListViewController else {
                    return UIViewController()
            }
            viewController.loadViewIfNeeded()
            viewController.inject(genreId)
            return viewController
            
        case .movie(let movieId):
            
            guard let viewController = storyboardViewController as? MovieViewController else {
                return UIViewController()
            }
            viewController.loadViewIfNeeded()
            viewController.inject(movieId)
            return viewController
            
        }
            
    }
}

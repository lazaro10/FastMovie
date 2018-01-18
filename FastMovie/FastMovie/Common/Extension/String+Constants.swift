//
//  String+Constants.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

extension String {
    struct NetworkError {
        static let mapping = "An unexpected error occurred while communicating with the server."
        static let weakConnection = "Apparently your connection is weak."
        static let offline = "You are currently offline."
        static let other = "An unexpected error has occurred."
    }
    
    struct API {
        static let baseURL = "https://api.themoviedb.org/3/"
        static let apiKey = "5537f1e43fe3693b3365549d0a5cd5e4"
        static let imageBaseURL = "https://image.tmdb.org/t/p/w185/"
    }
    
    struct Defaults {
        static let genresDefaults = "genresDefaults"
    }
}


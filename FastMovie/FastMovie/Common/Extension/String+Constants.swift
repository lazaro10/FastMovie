//
//  String+Constants.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

extension String {
    struct NetworkError {
        static let mapping = "Ocorreu um erro inesperado."
        static let weakConnection = "Aparentemente sua conexão está fraca."
        static let offline = "No momento você está offline."
        static let other = "Um erro inesperado ocorreu durante a comunicação com o servidor."
    }
    
    struct API {
        static let baseURL = "https://api.themoviedb.org/3/"
        static let apiKey = "5537f1e43fe3693b3365549d0a5cd5e4"
    }
}


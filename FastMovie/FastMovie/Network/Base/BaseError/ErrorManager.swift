//
//  ErrorManager.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 15/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct ErrorManager {
    
    func message(for error: NetworkError) -> String {
        switch error {
        case .unexpected:
            return "Algo deu errado."
        case .timeout:
            return "Tempo esgotado! Aparentemente sua conexão está fraca."
        case .unauthorized:
            return "Você não está autorizado para executar essa ação."
        case .noConnection:
            return "Aparentemente você está sem conexão."
        }
    }
    
}

//
//  ErrorManager.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 18/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct ErrorManager {
    func handle(_ error: NetworkError,
                on viewController: UIViewController? = nil,
                completion:@escaping () -> Void) {
        
        let errorViewController = ErrorViewController(message: error.localizedDescription) {
            completion()
        }
        viewController?.present(errorViewController, animated: false, completion: nil)
    }
}

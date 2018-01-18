//
//  SceneCoordinator.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit
import RxSwift

enum SceneCoordinatorError: Error {
    
    // transition
    case noRootViewController
    case pushFromNonNavigationController
    
    // pop
    case popFromRoot
    case dismissRoot
}

class SceneCoordinator: SceneCoordinatorType {
    
    private var currentViewController: UIViewController?
    
    init(currentViewController: UIViewController) {
        self.currentViewController = currentViewController
    }
    
    @discardableResult
    func transition(_ transition: SceneTransition, to scene: SceneType) -> Completable {
        
        let viewController = scene.viewController
        
        switch transition {
            
        case .push(let animated):
            
            guard let navigationController = currentViewController as? UINavigationController else {
                return .error(currentViewController == nil ?
                    SceneCoordinatorError.noRootViewController :
                    SceneCoordinatorError.pushFromNonNavigationController)
            }
            
            return push(source: navigationController,
                        viewController: viewController,
                        animated: animated)
        }
    }
    
    private func push(source: UINavigationController, viewController: UIViewController, animated: Bool) -> Completable {
        
        let subject = PublishSubject<Void>()
        
        source.pushViewController(viewController, animated: animated) {
            subject.onCompleted()
        }
        
        return subject.ignoreElements()
    }
}


//
//  GenresPresenterFactory.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 17/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

struct GenresPresenterFactory {
    static func make(interector: GenresInterector, delegate: GenresPresentation, coordinator: UIViewController) -> GenresPresenter {
        return GenresPresenter(interector: interector, delegate: delegate, coordinator: coordinator)
    }
}

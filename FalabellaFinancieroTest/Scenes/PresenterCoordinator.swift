//
//  PresenterCoordinator.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import Foundation

protocol CoordinatorPresenterProtocol: class {
    func handleStartApp()
}

final class CoordinatorPresenter: MVPPresenter {
    weak var view: ViewCoordinatorProtocol?
}

extension CoordinatorPresenter: CoordinatorPresenterProtocol {
    func handleStartApp() {
        view?.goToLogin()
    }
}

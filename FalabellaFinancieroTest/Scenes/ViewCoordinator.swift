//
//  ViewCoordinator.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol ViewCoordinatorProtocol: class {
    func goToLogin()
    func goToDataScene()
    func doToDetailScene()
}

protocol Router {
    func successLogin()
    func selectItemList()
}

final class ViewCoordinator: MVPView {
        
    typealias Presenter = CoordinatorPresenterProtocol
    static let instance: ViewCoordinator = {
        let presenter = CoordinatorPresenter()
        let coordinator = ViewCoordinator(presenter: presenter)
        
        presenter.view = coordinator
        return coordinator
    }()
    let presenter: CoordinatorPresenterProtocol
    let rootNavigationController: UINavigationController = .init()
    lazy var application: UIApplicationProtocol = self.inyect()

    init(presenter: CoordinatorPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension ViewCoordinator {
    var rootViewController: UIViewController {
        if rootNavigationController.topViewController == nil {
            presenter.handleStartApp()
        }
        rootNavigationController.isNavigationBarHidden = true
        return rootNavigationController
    }
}

extension ViewCoordinator: Router {
    func successLogin() {
        goToDataScene()
    }
    
    func selectItemList() {
//        TODO
    }
    
    
}

extension ViewCoordinator: ViewCoordinatorProtocol {
    func goToLogin() {
        goTo(controller: LoginViewController())
    }
    
    func goToDataScene() {
        goTo(controller: DataSceneViewController())
    }
    
    func doToDetailScene() {
//        ToDo
    }
}

// MARK: Private Methods

private extension ViewCoordinator {
    func goTo(controller: UIViewController) {
        rootNavigationController.pushViewController(controller, animated: rootNavigationController.topViewController != nil)
    }
    
    func presentar(controlador: UIViewController) {
        rootNavigationController.topViewController?.present(
            controlador,
            animated: true,
            completion: nil)
    }
}

// MARK: MVPVista

extension MVPView {
    func inyect() -> Router {
        return ViewCoordinator.instance
    }
}


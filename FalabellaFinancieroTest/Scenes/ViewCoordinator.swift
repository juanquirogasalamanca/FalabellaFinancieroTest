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
    func goToDetailScene(item: StoreData)
    func backToDetailScene()
    func Logout()
}

protocol Router {
    func successLogin()
    func selectItemList(item: StoreData)
    func backToListScene()
    func successLogOut()
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
    lazy var application: UIApplicationProtocol = self.inject()

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
    func successLogOut() {
        
    }
    
    func backToListScene() {
        backToDetailScene()
    }
    
    
    func successLogin() {
        goToDataScene()
    }
    
    func selectItemList(item: StoreData) {
        goToDetailScene(item: item)
    }
    
    
}

extension ViewCoordinator: ViewCoordinatorProtocol {
    func backToDetailScene() {
        back()
    }
    
    func Logout() {
        
    }
    
    func goToLogin() {
        goTo(controller: LoginViewController())
    }
    
    func goToDataScene() {
        goTo(controller: DataSceneViewController())
    }
    
    func goToDetailScene(item: StoreData) {
        let vc: DetailSceneViewController = DetailSceneViewController()
        vc.store = item
        present(controller: vc)
    }
}

// MARK: Private Methods

private extension ViewCoordinator {
    func goTo(controller: UIViewController) {
        rootNavigationController.pushViewController(controller, animated: rootNavigationController.topViewController != nil)
    }
    
    func present(controller: UIViewController) {
        rootNavigationController.pushViewController(controller,
                                                    animated: false)
    }
    func back(){
        rootNavigationController.popViewController(animated: true)
    }
}

// MARK: MVPVista

extension MVPView {
    func inject() -> Router {
        return ViewCoordinator.instance
    }
}


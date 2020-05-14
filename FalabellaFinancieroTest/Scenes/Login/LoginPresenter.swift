//
//  LoginPresenter.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol {
    func validateUser(user: String, password: String)
}

extension MVPView where Self: LoginViewProtocol {
    func inject() -> LoginPresenterProtocol  {
        let presenter = LoginPresenter()
        presenter.view = self
        return presenter
    }
}

final class LoginPresenter: MVPPresenter{
    weak var view: LoginViewProtocol?
    lazy var sessionManager: SessionManagerProtocol = Self.inject()
    var dataSession : Session?
    func sceneLoad() {
        sessionManager.saveSession(session: DataMocks.mockUser)
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    
    func validateUser(user: String, password: String) {
        guard  user != "", password != "" else {
            view?.showError(error: "Error No data.")
            return
        }
        dataSession = Session(userName: user, password: password)
        
        guard dataSession == sessionManager.getSession() else {
            view?.showError(error: "Incorrect User or Password")
            return}
        makeLogin()
    }
}

private extension LoginPresenter{
    func makeLogin(){
        view?.showError(error: "Ingresa tu usuario y tu contraseña")
        view?.goToList()
    }
}

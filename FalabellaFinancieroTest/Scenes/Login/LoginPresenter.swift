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
    
    func sceneLoad() {
        sessionManager.saveSession(session: DataMocks.mockUser)
    }
    
    
}

extension LoginPresenter: LoginPresenterProtocol {
    
    func validateUser(user: String, password: String) {
        guard let _user: String = user, let _password: String = password, _password != "" else {
            view?.showError(error: "Error No data.")
            return
        }
        let data = Session(userName: _user, password: _password)
        
        guard data == sessionManager.getSession() else {
            view?.showError(error: "Incorrect User or Password")
            return}
        makeLogin(user: _user, password: _password)
    }
    
    
}

private extension LoginPresenter{
    func makeLogin(user: String , password: String){
        view?.goToList()
    }
}

//
//  LoginScenePresenter.swift
//  FalabellaFinancieroTest
//
//  Created Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//
//  Template generated by Edward
//

import Foundation

// MARK: View -
protocol LoginSceneViewProtocol: class {

}

// MARK: Presenter -
protocol LoginScenePresenterProtocol: class {
	var view: LoginSceneViewProtocol? { get set }
    func viewDidLoad()
}

class LoginScenePresenter: LoginScenePresenterProtocol {

    weak var view: LoginSceneViewProtocol?

    func viewDidLoad() {

    }
}

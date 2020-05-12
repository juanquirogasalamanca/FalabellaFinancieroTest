//
//  LoginViewController.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: class {
    func showError(error: String)
    func goToList()
}

final class LoginViewController: BaseViewController, MVPView {
     lazy var presenter: LoginPresenterProtocol = self.inyect()
    lazy var router: Router = self.inyect()

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func loginAction(_ sender: Any) {
        errorLabel.text = ""
        presenter.validateUser(user: userTextField.text!, password: passwordTextField.text!)
    }
}

extension LoginViewController: LoginViewProtocol {
    func showError(error: String) {
        errorLabel.text = error
    }
    
    func goToList() {
        router.successLogin()
    }
}

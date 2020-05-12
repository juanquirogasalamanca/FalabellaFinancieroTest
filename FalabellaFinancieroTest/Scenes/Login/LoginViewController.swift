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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: LoginViewProtocol {
    func showError(error: String) {
        errorLabel.text = error
    }
    
    func goToList() {
//        
    }
    
    
}

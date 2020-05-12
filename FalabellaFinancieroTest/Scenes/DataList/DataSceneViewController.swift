//
//  DataSceneViewController.swift
//  FalabellaFinancieroTest
//
//  Created Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//
//
//

import UIKit


protocol DataSceneViewProtocol: class {
    func searchData(word: String)
    func showData()
}

class DataSceneViewController: BaseViewController, MVPView {

	var presenter: DataScenePresenterProtocol?


	override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension DataSceneViewController: DataSceneViewProtocol {
    func showData() {
        
    }
    
    func searchData(word: String) {
        
    }
    
    
}

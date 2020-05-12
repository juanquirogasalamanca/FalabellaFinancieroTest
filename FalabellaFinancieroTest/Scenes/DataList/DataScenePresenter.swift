//
//  DataScenePresenter.swift
//  FalabellaFinancieroTest
//
//  Created Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//
//
//

import Foundation

protocol DataScenePresenterProtocol: class {
	func fetchData()
}

extension MVPView where Self: DataSceneViewProtocol {
    func inyect() -> DataScenePresenterProtocol  {
        let presenter = DataScenePresenter()
        presenter.view = self
        return presenter
    }
}

class DataScenePresenter: MVPPresenter {
     weak var view: DataSceneViewProtocol?

}

extension DataScenePresenter: DataScenePresenterProtocol {
    func fetchData() {
        
    }
    
    
}

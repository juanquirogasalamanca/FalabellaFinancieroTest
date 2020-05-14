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
    func searchData(word: String)
}

extension MVPView where Self: DataSceneViewProtocol {
    func inject() -> DataScenePresenterProtocol  {
        let presenter = DataScenePresenter()
        presenter.view = self
        return presenter
    }
}

class DataScenePresenter: MVPPresenter {
    weak var view: DataSceneViewProtocol?
    lazy var apiRequest: APIProtocol = Self.inject()

}

extension DataScenePresenter: DataScenePresenterProtocol {
    func searchData(word: String) {
        let url = API.Constants.searchURL + word
        apiRequest.getRequest(requestURL: url) { (response) in
           self.view?.updateData(stores: response)
        }
    }
    
    func fetchData() {
        apiRequest.getRequest(requestURL: API.Constants.listDataURL) { (response) in
            self.view?.updateData(stores: response)
        }
    }
    
    
}

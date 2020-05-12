//
//  MVP.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import Foundation

protocol MVPPresenter: class, SceneObserver {
    associatedtype View
    
    var view: View? { get }
}

protocol MVPView: SceneController {
    associatedtype Presenter
    
    var presenter: Presenter { get }
}

extension MVPView  {
    var observer: SceneObserver? {
        return presenter as? SceneObserver
    }
}



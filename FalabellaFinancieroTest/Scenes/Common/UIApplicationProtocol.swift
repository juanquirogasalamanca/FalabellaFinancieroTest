//
//  UIApplicationProtocol.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import UIKit

protocol UIApplicationProtocol: class {
    func openURL(_ url: URL) -> Bool
}

extension UIApplication: UIApplicationProtocol {}

extension MVPView where Self: ViewCoordinator {
    func inject() -> UIApplicationProtocol {
        return UIApplication.shared
    }
}

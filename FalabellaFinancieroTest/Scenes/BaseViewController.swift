//
//  ViewController.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import UIKit
import Foundation

protocol SceneObserver {
    func sceneDidLoad()
    func sceneWillAppear()
    func sceneDidAppear()
    func sceneLoad()
    func sceneWillDissapear()
    func sceneDidDissappear()
}
extension SceneObserver{
    func sceneDidLoad(){}
    func sceneWillAppear(){}
    func sceneDidAppear(){}
    func sceneLoad(){}
    func sceneWillDissapear(){}
    func sceneDidDissappear(){}
}

protocol SceneController {
    var observer: SceneObserver? { get }
}
class BaseViewController: UIViewController {
    
    private var sceneObserver: SceneObserver? {
        return (self as? SceneController)?.observer
    }
    
    override func viewDidLoad() {
       let nibName = String(describing: type(of: self))
       self.view = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView
        self.sceneObserver?.sceneLoad()
       super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.sceneObserver?.sceneWillAppear()
       super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        self.sceneObserver?.sceneDidAppear()
       super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.sceneObserver?.sceneWillDissapear()
       super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.sceneObserver?.sceneDidDissappear()
       super.viewDidDisappear(animated)
    }

    deinit {

    }

}


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
    func updateData(stores: [StoreData])
    func updateUserName(name: String)
}

final class DataSceneViewController: BaseViewController, MVPView {

    lazy var presenter: DataScenePresenterProtocol = self.inject()
    lazy var router: Router = self.inject()

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var stores: [StoreData] = []
    let tableCellID = "StoreTableViewCell"
    
	override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        
    }

    @IBAction func searchAction(_ sender: Any) {
        guard let searchText = searchTextField.text else {return}
        searchData(word: searchText)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        router.successLogOut()
    }
    
}

extension DataSceneViewController: DataSceneViewProtocol {
    func updateUserName(name: String) {
        userNameLabel.text = name
    }
    
    
    func updateData(stores: [StoreData]){
        self.stores = stores
        tableView.reloadData()
    }
}

extension DataSceneViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:StoreTableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath)) as! StoreTableViewCell

        let store = stores[indexPath.row]
        cell.storeNameLabel.text = store.storeName
        cell.storeAddressLabel.text = store.storeAddress
        cell.countyNameLabel.text = store.countyName
        return cell
    }
}

extension DataSceneViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.selectItemList(item: stores[indexPath.row])
    }
}

private extension DataSceneViewController {
    
    func setupScene(){
        setupTable()
        presenter.fetchData()
    }
    
    func showData() {
        presenter.fetchData()
    }
    
    func searchData(word: String) {
        presenter.searchData(word: word)
    }
    
    func setupTable(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: tableCellID, bundle: nil), forCellReuseIdentifier: tableCellID)
        
    }
}

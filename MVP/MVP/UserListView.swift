//
//  UserListView.swift
//  MVP
//
//  Created by 김영균 on 2022/06/19.
//

import UIKit

class UserListView: UIViewController {
    var presenter: UserListPresenterProtocol?
    var userList = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}
extension UserListView: UserListViewProtocol {
    func showUsers(with users: [User]) {
        self.userList = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
// MARK: TableView Delegate, DataSource
extension UserListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = userList[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
}

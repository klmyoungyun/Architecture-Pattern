//
//  UserListView.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import UIKit


class UserListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: UserListPresenterProtocol?
    var userList = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension UserListView: UserListViewProtocol {
    // presenter가 준 데이터를 그리면 됨.
    func showUsers(with users: [User]) {
        userList = users
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension UserListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = userList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = user.name
        content.secondaryText = user.email
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.showUserDetail(forUser: userList[indexPath.row])
    }
}


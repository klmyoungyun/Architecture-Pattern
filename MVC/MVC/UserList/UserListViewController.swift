//
//  UserListViewController.swift
//  MVC
//
//  Created by 김영균 on 2022/07/06.
//

import UIKit

class UserListViewController: UIViewController {
    
    @IBOutlet weak var headerView: UserListHeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    var model = [UserListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.delegate = self
        fetchData()
    }
    func fetchData() {
        UserListService.shared.fetchUserList { response in
            switch response {
            case .success(let data):
                self.model = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userListCell",
                                                 for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = model[indexPath.row].name
        content.secondaryText =  model[indexPath.row].email
        cell.contentConfiguration = content
        return cell
    }
}
extension UserListViewController: UserListHeaderViewDelegate {
    func changeLabel(target: UILabel) {
        target.text = "바꿨다"
    }
}

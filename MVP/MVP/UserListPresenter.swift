//
//  UserListPresenter.swift
//  MVP
//
//  Created by 김영균 on 2022/06/19.
//

import Foundation

class UserListPresenter: UserListPresenterProtocol {
    weak var view: UserListViewProtocol?
    func viewDidLoad() {
        UserListService.shared.fetchUserList { response in
            switch response {
            case .success(let model):
                self.view?.showUsers(with: model)
            case .failure(let error):
                print(error.localizedDescription)
                self.view?.showUsers(with: [])
            }
        }
    }
}

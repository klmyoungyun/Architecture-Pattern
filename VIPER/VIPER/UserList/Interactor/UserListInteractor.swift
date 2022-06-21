//
//  UserListInteractor.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import Foundation

class UserListInteractor: UserListInputInteractorProtocol {
    
    weak var presenter: UserListOutputInteractorProtocol?

    func getUserList() {
        UserListService.shared.fetchUserData { response in
            switch response {
            case .success(let model):
                if let users = model as? [User] {
                    self.presenter?.userListDidFetch(userList: users)
                }
            case .fail:
                print("error")
            }
        }
    }
}

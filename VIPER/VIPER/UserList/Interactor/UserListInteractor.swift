//
//  UserListInteractor.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import Foundation

class UserListInteractor: UserListInteractorInputProtocol {
    weak var presenter: UserListInteractorOutputProtocol?
    
    func fetchUserList() {
        UserListService.shared.fetchUserData { response in
            switch response {
            case .success(let model):
                if let users = model as? [User] {
                    self.presenter?.didFetchUserList(users)
                }
            case .fail:
                print("error")
            }
        }
    }
}

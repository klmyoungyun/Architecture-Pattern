//
//  UserListInteractor.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import Foundation

class UserListInteractor: UserListInteractorInputProtocol {
    weak var presenter: UserListInteractorOutputProtocol?
    var service: UserListServiceInputProtocol?
    
    func fetchUserList() {
        service?.fetchUserList()
    }
}

extension UserListInteractor: UserListServiceOutputProtocol {
    func onUserListFetched(_ users: [User]) {
        presenter?.didFetchUserList(users)
    }
    
    func onError() {
        presenter?.onError()
    }
}

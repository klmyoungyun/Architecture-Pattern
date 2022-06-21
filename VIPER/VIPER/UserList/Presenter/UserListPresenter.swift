//
//  UserListPresenter.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import Foundation


class UserListPresenter: UserListPresenterProtocol {
    weak var view: UserListViewProtocol?
    var interactor: UserListInputInteractorProtocol?
    
    func viewDidLoad() {
        self.loadUserList()
    }
    func loadUserList() {
        interactor?.getUserList()
    }
}

extension UserListPresenter: UserListOutputInteractorProtocol {
    // interactor가 presenter에게 데이터 줄 때
    func userListDidFetch(userList: [User]) {
        view?.showUsers(with: userList)
    }
}

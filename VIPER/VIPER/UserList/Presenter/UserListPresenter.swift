//
//  UserListPresenter.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import Foundation


class UserListPresenter: UserListPresenterProtocol {
    weak var view: UserListViewProtocol?
    var interactor: UserListInteractorInputProtocol?
    var wireframe: UserListWireFrameProtocol?
    
    func showUserDetail(forUser user: User) {
        wireframe?.presentUserDetail(from: view!, with: user)
    }
    func viewDidLoad() {
        self.loadUserList()
    }
    func loadUserList() {
        interactor?.fetchUserList()
    }
}

extension UserListPresenter: UserListInteractorOutputProtocol {
    // interactor가 presenter에게 데이터 줄 때
    func didFetchUserList(_ userList: [User]) {
        view?.showUsers(with: userList)
    }
    
    func onError() {
        view?.showUsers(with: [])
    }
}

//
//  UserListProtocols.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import Foundation

/// VIEW -> PRESENTER
protocol UserListPresenterProtocol: AnyObject {
    var view: UserListViewProtocol? { get set }
    var interactor: UserListInputInteractorProtocol? { get set }
    func viewDidLoad()

}
/// PRESNETER -> VIEW
protocol UserListViewProtocol: AnyObject {
    func showUsers(with users: [User])
}

/// Presenter -> Interactor
// Presenter: Interactor야 데이터 내놔
protocol UserListInputInteractorProtocol: AnyObject {
    var presenter: UserListOutputInteractorProtocol? { get set }
    func getUserList()
}
/// Interactor -> Presenter
// Interactor: Presenter님 데이터 여기있습니다~
protocol UserListOutputInteractorProtocol: AnyObject {
    func userListDidFetch(userList: [User])
}

protocol UserListWireFrameProtocol: AnyObject {
    
}

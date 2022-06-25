//
//  UserListPresenter.swift
//  MVP
//
//  Created by 김영균 on 2022/06/24.
//

import Foundation

protocol UserListViewProtocol: AnyObject {
    func showUsers(with users: [User])
    
}
protocol UserListPresenterProtocol: AnyObject {
    var view: UserListViewProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}

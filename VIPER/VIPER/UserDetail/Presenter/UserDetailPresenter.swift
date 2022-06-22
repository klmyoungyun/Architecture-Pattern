//
//  UserDetailPresenter.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/22.
//

import Foundation

class UserDetailPresenter: UserDetailPresenterProtocol {
    weak var view: UserDetailViewProtocol?
    var wireframe: UserDetailWireFrameProtocol?
    var user: User?
    
    func viewDidLoad() {
        guard let user = user else { return }
        view?.showUserDetail(with: user)
    }
    
    func didTapBackButton() {
        wireframe?.goBackToUserListView(from: view!)
    }
}

//
//  UserDetailViewModel.swift
//  MVVM
//
//  Created by 김영균 on 2022/07/12.
//

import Foundation

import RxSwift

protocol UserDetailViewModelInput {
    
}
protocol UserDetailViewModelOutput {
    var nameText: Observable<String> { get }
    var emailText: Observable<String> { get }
    var phoneText: Observable<String> { get }
}
protocol UserDetailViewModelType: UserDetailViewModelInput,
                                    UserDetailViewModelOutput { }

final class UserDetailViewModel: UserDetailViewModelType {
    let disposeBag = DisposeBag()
    
    // MARK: - INPUT
    
    // MARK: - OUTPUT
    let nameText: Observable<String>
    let emailText: Observable<String>
    let phoneText: Observable<String>
    
    init(_ selectedUser: User = User()) {
        let user = Observable.just(selectedUser)
        nameText = user.map { $0.name }
        emailText = user.map { $0.email }
        phoneText = user.map { $0.phone }
    }
}

//
//  UserListViewModel.swift
//  MVVM
//
//  Created by 김영균 on 2022/07/10.
//

import Foundation
import RxSwift

protocol UserListViewModelInput {
    var fetchUsers: AnyObserver<Void> { get }
}
protocol UserListViewModelOutput {
    var allUsers: Observable<[User]> { get }
    var activated: Observable<Bool> { get }
    var errored: Observable<NSError> { get }
}
protocol UserListViewModelType: UserListViewModelInput, UserListViewModelOutput { }

final class UserListViewModel: UserListViewModelType {
    let disposeBag = DisposeBag()
    
    // MARK: - INPUT
    let fetchUsers: AnyObserver<Void>
    
    // MARK: - Output
    let allUsers: Observable<[User]>
    let activated: Observable<Bool>
    let errored: Observable<NSError>
    
    init(service: UserListServiceProtocol = UserListService()) {
       let fetching = PublishSubject<Void>()
        
        let error = PublishSubject<Error>()
        let activating = BehaviorSubject<Bool>(value: false)
        let users = BehaviorSubject<[User]>(value: [])
        
        fetchUsers = fetching.asObserver()
        fetching
            .do(onNext: { _ in activating.onNext(true) })
            .flatMap(service.fetchUserListRx)
            .do(onNext: { _ in activating.onNext(false) })
            .do(onError: { error.onNext($0) })
            .subscribe(onNext: { users.onNext($0) })
            .disposed(by: disposeBag)
        
        
        // OUTPUT
        activated = activating.distinctUntilChanged()
        allUsers = users
        errored = error.map { $0 as NSError }
    }
}

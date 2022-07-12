//
//  APIService.swift
//  MVVM
//
//  Created by 김영균 on 2022/07/12.
//

import Foundation
import Alamofire
import RxSwift

protocol UserListServiceProtocol {
    func fetchUserListRx() -> Observable<[User]>
}
class UserListService: UserListServiceProtocol {
    enum NetworkErrorType: Int, Error {
        case badRequest = 400
        case authenticationFailed = 401
        case notFoundException = 404
        case systemError = 500
        case endpointError = 503
        case timeout = 504
        
    }
    func fetchUserListRx() -> Observable<[User]> {
        return Observable.create { observer in
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else  {
                observer.onError(NetworkErrorType.badRequest)
                return Disposables.create()
            }
            
            AF.request(url, method: .get).responseDecodable(of: [User].self) { response in
                if response.error != nil {
                    observer.onError(NetworkErrorType.badRequest)
                }
                if let value = response.value {
                    observer.onNext(value)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}

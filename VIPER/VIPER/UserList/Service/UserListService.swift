//
//  UserListService.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import Foundation

class UserListService: UserListServiceInputProtocol {
    var interactor: UserListServiceOutputProtocol?
    
    func fetchUserList() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                self.interactor?.onUserListFetched(users)
            } catch {
                self.interactor?.onError()
            }
        }
        task.resume()
    }
}

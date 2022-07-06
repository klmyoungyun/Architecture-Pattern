//
//  UserListService.swift
//  MVC
//
//  Created by 김영균 on 2022/07/06.
//

import Foundation

struct UserListService {
    static let shared = UserListService()
    private init() {}
    
    
    func fetchUserList(completion: @escaping ((Result<[UserListModel], Error>) -> Void)) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return
            }
            do {
                let users = try JSONDecoder().decode([UserListModel].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}

//
//  UserListService.swift
//  MVP
//
//  Created by 김영균 on 2022/06/24.
//

import Foundation

struct UserListService {
    static let shared = UserListService()
    private init() {}
    
    
    func fetchUserList(completion: @escaping ((Result<[User], Error>) -> Void)) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}

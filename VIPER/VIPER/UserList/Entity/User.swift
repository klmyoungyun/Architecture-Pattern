//
//  User.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
}

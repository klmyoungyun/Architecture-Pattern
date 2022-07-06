//
//  UserListModel.swift
//  MVC
//
//  Created by 김영균 on 2022/07/06.
//

import Foundation

struct UserListModel: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
}

struct Address: Codable {
    let street: String
    let geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}

//
//  User.swift
//  MVVM
//
//  Created by 김영균 on 2022/07/10.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let website: String
    
    init() {
        self.id = 0
        self.name = ""
        self.email = ""
        self.phone = ""
        self.website = ""
    }
}

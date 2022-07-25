//
//  TabBarPage.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import Foundation

enum TabBarPage: String, CaseIterable {
    case first, second, third
    
    init?(index: Int) {
        switch index {
        case 0: self = .first
        case 1: self = .second
        case 2: self = .third
        default: return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .first: return "First Page"
        case .second: return "Second Page"
        case .third: return "Third Page"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .first: return 0
        case .second: return 1
        case .third: return 2
        }
    }
    
    func tabIconName() -> String {
        return self.rawValue
    }
}

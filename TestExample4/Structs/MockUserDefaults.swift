//
//  UserDefault.swift
//  TestExample4
//
//  Created by варя on 16/10/2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import UIKit

extension UserDefaults {
    static var isDebug = false
    static var mockedFile: [[String: Any]]?
    
    static func getPeopleList() -> [[String: Any]]? {
        if isDebug {
            return mockedFile
        }
        return UserDefaults.standard.value(forKey: "peopleList") as? [[String: Any]]
    }
    
    
}

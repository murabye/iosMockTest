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
    
    static func getPeopleList() -> [[String: Any]] {
        if isDebug {
            return UserDefaults.standard.value(forKey: "peopleList") as! [[String: Any]]
        }
        return UserDefaults.standard.value(forKey: "peopleList") as! [[String: Any]]
    }
}

//
//  DisplayTest.swift
//  TestExample4Tests
//
//  Created by варя on 16/10/2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import XCTest
@testable import TestExample4

class DisplayTest: XCTestCase {
    
    //     override func numberOfSections(in tableView: UITableView) -> Int {
    //    @IBAction func segmentDidChange(_ sender: Any) {
    //     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    override func setUp() {
        UserDefaults.isDebug = true
        UserDefaults.mockedFile = [
            ["name": "Вован",
             "post": "говновоз",
             "status": true,
             "wage": 15,
             "haveExp": false,
             "startDate": Date()],
            ["name": "Варенька",
             "post": "умница",
             "status": true,
             "wage": 100500,
             "haveExp": true,
             "startDate": Date()],
            ["name": "Лебедев",
             "post": "главный электроник",
             "status": false,
             "wage": 15000,
             "haveExp": false,
             "startDate": Date()]
        ]
    }
    
    override func tearDown() {
    }
    
    func testRegistration() {
        XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // segmentDidChange
    // numberOfSections
    // tableView
}




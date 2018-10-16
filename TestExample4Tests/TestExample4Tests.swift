//
//  TestExample4Tests.swift
//  TestExample4Tests
//
//  Created by Вова Петров on 01.10.2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import XCTest
@testable import TestExample4

class TestExample4Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdd() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "add") as! AddViewController
        vc.expSwitch.isOn = true
        vc.nameField.text = "Vova"
        vc.postField.text = "Professor"
        vc.wageField.text = "5423"
        vc.startDatePicker.date = Date.init()
        XCTAssertEqual(true, vc.saveCheck())
        vc.nameField.text = ""
        XCTAssertEqual(false, vc.saveCheck())
        vc.nameField.text = "Vova"
        vc.postField.text = ""
        XCTAssertEqual(false, vc.saveCheck())
        vc.postField.text = "Professor"
        vc.wageField.text = ""
        XCTAssertEqual(false, vc.saveCheck())
    }
    
    func testChange() {
        let vc = ChangeViewController()
        vc.searchField.text = "Vov"
        XCTAssertEqual(false, vc.searchCheck())
        vc.searchField.text = "Vova"
        XCTAssertEqual(true, vc.searchCheck())
        vc.postField.text = "Professor Number One"
        XCTAssertEqual(true, vc.saveCheck())
        XCTAssertEqual(true, vc.searchCheck())
        XCTAssertEqual(vc.postField.placeholder, "Professor Number One")
        vc.wageField.text = "145"
        XCTAssertEqual(true, vc.saveCheck())
        XCTAssertEqual(true, vc.searchCheck())
        XCTAssertEqual(vc.wageField.placeholder, "145")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

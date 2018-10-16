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
    
    //     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    override func setUp() {
        UserDefaults.isDebug = true
    }
    
    func defaultMock() {
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
    
    func test_SegmentDidChange_FirstSegment() {
        defaultMock()
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "search") as! DisplayController
        vc.loadView()
        vc.viewWillAppear(true)
        
        vc.segmentControl.selectedSegmentIndex = 0
        vc.segmentDidChange(self)
        
        XCTAssertEqual(vc.filteredEmployees?.count, 3)
    }
    
    func test_SegmentDidChange_SecondSegment() {
        defaultMock()
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "search") as! DisplayController
        vc.loadView()
        vc.viewWillAppear(true)
        
        vc.segmentControl.selectedSegmentIndex = 1
        vc.segmentDidChange(self)
        
        XCTAssertEqual(vc.filteredEmployees?.count, 2)
    }
    
    func test_SegmentDidChange_ThirdSegment() {
        defaultMock()
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "search") as! DisplayController
        vc.loadView()
        vc.viewWillAppear(true)
        
        vc.segmentControl.selectedSegmentIndex = 2
        vc.segmentDidChange(self)
        
        XCTAssertEqual(vc.filteredEmployees?.count, 1)
    }
    
    func test_SegmentDidChange_AllSegment() {
        defaultMock()
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "search") as! DisplayController
        vc.loadView()
        vc.viewWillAppear(true)
        
        vc.segmentControl.selectedSegmentIndex = 0
        vc.segmentDidChange(self)
        vc.segmentControl.selectedSegmentIndex = 1
        vc.segmentDidChange(self)
        vc.segmentControl.selectedSegmentIndex = 2
        vc.segmentDidChange(self)
        
        XCTAssertEqual(vc.filteredEmployees?.count, 1)
    }
    
    func test_numberOfSection_0() {
        UserDefaults.mockedFile = []
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "search") as! DisplayController
        vc.loadView()
        vc.viewWillAppear(true)
        
        XCTAssertEqual(vc.numberOfSections(in: vc.tableView), 0)
    }
    
    func test_numberOfSection_1() {
        UserDefaults.mockedFile = [
            ["name": "Вован",
             "post": "говновоз",
             "status": true,
             "wage": 15,
             "haveExp": false,
             "startDate": Date()]
        ]
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "search") as! DisplayController
        vc.loadView()
        vc.viewWillAppear(true)
        
        XCTAssertEqual(vc.numberOfSections(in: vc.tableView), 1)
    }
    
    func test_numberOfSection_many() {
        defaultMock()
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "search") as! DisplayController
        vc.loadView()
        vc.viewWillAppear(true)
        
        XCTAssertEqual(vc.numberOfSections(in: vc.tableView), 3)
    }
    
    func test_cell_fullCheck() {
        defaultMock()
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "search") as! DisplayController
        vc.loadView()
        vc.viewWillAppear(true)
        
        var cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Имя")
        XCTAssertEqual(cell.detailTextLabel?.text, "Вован")
        
        cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 1, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Должность")
        XCTAssertEqual(cell.detailTextLabel?.text, "говновоз")
        
        cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 2, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Статус")
        XCTAssertEqual(cell.detailTextLabel?.text, "Активен")
        
        cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 3, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Зарплата")
        XCTAssertEqual(cell.detailTextLabel?.text, "15Р")
        
        cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 4, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Опыт при приеме")
        XCTAssertEqual(cell.detailTextLabel?.text, "Не был")
        
        cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 5, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Дата приема")
        
        cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 2, section: 2))
        XCTAssertEqual(cell.textLabel?.text, "Статус")
        XCTAssertEqual(cell.detailTextLabel?.text, "Неактивен")
        
        cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 4, section: 1))
        XCTAssertEqual(cell.textLabel?.text, "Опыт при приеме")
        XCTAssertEqual(cell.detailTextLabel?.text, "Был")
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




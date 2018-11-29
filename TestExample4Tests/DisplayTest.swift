//
//  DisplayTest.swift
//  TestExample4Tests
//
//  Created by варя on 16/10/2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import XCTest
import CoreData

@testable import TestExample4

class DisplayTest: XCTestCase {
    
    override func setUp() {
    }
    
    func cleanDB() {
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try PersistenceService.context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                PersistenceService.context.delete(objectData)
            }
        } catch {}
    }
    
    func defaultMock() {
        cleanDB()
        
        addVova()
        addVarya()
        addLebedev()
    }
    
    func addVova() {
        let employee = Person(context: PersistenceService.context)
        employee.name = "Вован"
        employee.post = "Попа"
        employee.status = true
        employee.wage = 10
        employee.exp = false
        employee.startDate = Date() as NSDate
        PersistenceService.saveContext()
    }
    func addVarya() {
        let employee = Person(context: PersistenceService.context)
        employee.name = "Варенька"
        employee.post = "Главная умница"
        employee.status = true
        employee.wage = 1_000_000
        employee.exp = true
        employee.startDate = Date() as NSDate
        PersistenceService.saveContext()
    }
    func addLebedev() {
        let employee = Person(context: PersistenceService.context)
        employee.name = "Лебедев"
        employee.post = "Главный электроник"
        employee.status = false
        employee.wage = 1
        employee.exp = false
        employee.startDate = Date() as NSDate
        PersistenceService.saveContext()
    }
    
    override func tearDown() {
        cleanDB()
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
        cleanDB()
        addVova()
        
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
        XCTAssertEqual(cell.detailTextLabel?.text, "Попа")
        
        cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 2, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Статус")
        XCTAssertEqual(cell.detailTextLabel?.text, "Активен")
        
        cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 3, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Зарплата")
        XCTAssertEqual(cell.detailTextLabel?.text, "10Р")
        
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




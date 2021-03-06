//
//  TestExample4Tests.swift
//  TestExample4Tests
//
//  Created by Вова Петров on 01.10.2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import XCTest
import CoreData
@testable import TestExample4

class TestExample4Tests: XCTestCase {

    override func setUp() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "add") as! AddViewController
        vc.loadView()
        vc.expSwitch.isOn = true
        vc.nameField.text = "Vova"
        vc.postField.text = "Professor"
        vc.wageField.text = "5423"
        vc.startDatePicker.date = Date.init()
        vc.saveCheck()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdd() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "add") as! AddViewController
        vc.loadView()
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
        
        var emploeeArray: [Person] = []
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        do{
            emploeeArray = try PersistenceService.testContext.fetch(request)
        } catch {}
        for emploee in emploeeArray {
            if emploee.name == "Vova"{
                XCTAssertEqual("Professor", emploee.post)
            }
        }
    }
    
    func testChange() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "change") as! ChangeViewController
        vc.loadView()
        
        vc.searchField.text = "Vov"
        XCTAssertEqual(false, vc.searchCheck())
        vc.searchField.text = "Vova"
        XCTAssertEqual(true, vc.searchCheck())
        vc.postField.text = "Professor Number One"
        vc.wageField.text = "0"
        XCTAssertEqual(true, vc.saveCheck())
        XCTAssertEqual(true, vc.searchCheck())
        XCTAssertEqual(vc.postField.placeholder, "Professor Number One")
        vc.postField.text = "Professor"
        vc.wageField.text = "145"
        XCTAssertEqual(true, vc.saveCheck())
        XCTAssertEqual(true, vc.searchCheck())
        XCTAssertEqual(vc.wageField.placeholder, "145")
    }
    
    func testPerformanceRead() {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        measure {
            for _ in 0...10000 {
                do {
                    try PersistenceService.context.fetch(request)
                } catch {
                    print("ERROR")
                }
                
            }
        }
    }
    
    func testPerformanceReadBackground() {
        
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        measure {
            //for i in 0...10 {
                let thread = PersistenceService.persistentContainer.newBackgroundContext()
                    for _ in 0...10{
                        
                        PersistenceService.persistentContainer.performBackgroundTask({ (context) in
                            for _ in 0...1000{
                                do {
                                    try context.fetch(request)
                                } catch {
                                    print("ERROR")
                                }
                            }
                        })
                    }

                
            //}
        }
    }
    
    //private let perStore = NSPersistentStoreCoordinator.init(managedObjectModel: <#T##NSManagedObjectModel#>)
   /* private lazy var privateManagedObjectContex: NSManagedObjectContext = {
        var manageObjectContex = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        
        manageObjectContex.persistentStoreCoordinator = perStore
        
        return manageObjectContex
    }()*/

}

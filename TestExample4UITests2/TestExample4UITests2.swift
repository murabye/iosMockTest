//
//  TestExample4UITests2.swift
//  TestExample4UITests2
//
//  Created by варя on 29/11/2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import XCTest

class TestExample4UITests2: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app2 = XCUIApplication()
        let tabBarsQuery = app2.tabBars
        tabBarsQuery.buttons["History"].tap()
        
        let textField = app2.textFields["Логин"]
        textField.tap()
        
        let moreKey = app2/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"еще, цифры\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        
        let key = app2/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        
        let element = app2.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        
        let textField2 = app2.textFields["Пароль"]
        textField2.tap()
        moreKey.tap()
        key.tap()
        element.tap()
        
        let app = app2
        app.textFields["Пароль еще раз"].tap()
        moreKey.tap()
        key.tap()
        element.tap()
        app.buttons["Зарегистрироваться"].tap()
        tabBarsQuery.buttons["Favorites"].tap()
        textField.tap()
        moreKey.tap()
        key.tap()
        element.tap()
        textField2.tap()
        moreKey.tap()
        key.tap()
        element.tap()
        app.buttons["Войти"].tap()
        
        let tablesQuery = app2.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Создать"]/*[[".cells.staticTexts[\"Создать\"]",".staticTexts[\"Создать\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Введите имя"]/*[[".cells.textFields[\"Введите имя\"]",".textFields[\"Введите имя\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let key2 = app2/*@START_MENU_TOKEN@*/.keys["в"]/*[[".keyboards.keys[\"в\"]",".keys[\"в\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        
        let key3 = app2/*@START_MENU_TOKEN@*/.keys["о"]/*[[".keyboards.keys[\"о\"]",".keys[\"о\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        key2.tap()
        
        let key4 = app2/*@START_MENU_TOKEN@*/.keys["а"]/*[[".keyboards.keys[\"а\"]",".keys[\"а\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Введите должность"]/*[[".cells.textFields[\"Введите должность\"]",".textFields[\"Введите должность\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["п"]/*[[".keyboards.keys[\"п\"]",".keys[\"п\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let key5 = app2/*@START_MENU_TOKEN@*/.keys["р"]/*[[".keyboards.keys[\"р\"]",".keys[\"р\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5.tap()
        key3.tap()
        app2/*@START_MENU_TOKEN@*/.keys["ф"]/*[[".keyboards.keys[\"ф\"]",".keys[\"ф\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["е"]/*[[".keyboards.keys[\"е\"]",".keys[\"е\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let key6 = app2/*@START_MENU_TOKEN@*/.keys["с"]/*[[".keyboards.keys[\"с\"]",".keys[\"с\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key6.tap()
        key6.tap()
        key3.tap()
        key5.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Зарплата"]/*[[".cells.textFields[\"Зарплата\"]",".textFields[\"Зарплата\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        key.tap()
        
        let key7 = app2/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key7.tap()
        key7.tap()
        
        let tablesQuery2 = app.tables
        tablesQuery2.children(matching: .cell).element(boundBy: 3).children(matching: .textField).element.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.pickerWheels["2018"].press(forDuration: 0.8);/*[[".cells.pickerWheels[\"2018\"]",".tap()",".press(forDuration: 0.8);",".pickerWheels[\"2018\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        
        let navigationBar = app.navigationBars["Создание"]
        navigationBar.buttons["Add"].tap()
        navigationBar.buttons["Навигация"].tap()
        
        let staticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Отобразить"]/*[[".cells.staticTexts[\"Отобразить\"]",".staticTexts[\"Отобразить\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        staticText.tap()
        
        let testexample4DisplayNavigationBar = app2.navigationBars["TestExample4.Display"]
        let activeButton = testexample4DisplayNavigationBar/*@START_MENU_TOKEN@*/.buttons["Active"]/*[[".segmentedControls.buttons[\"Active\"]",".buttons[\"Active\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        activeButton.tap()
        
        let nonactiveButton = testexample4DisplayNavigationBar/*@START_MENU_TOKEN@*/.buttons["Nonactive"]/*[[".segmentedControls.buttons[\"Nonactive\"]",".buttons[\"Nonactive\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nonactiveButton.tap()
        
        let allButton = testexample4DisplayNavigationBar/*@START_MENU_TOKEN@*/.buttons["All"]/*[[".segmentedControls.buttons[\"All\"]",".buttons[\"All\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        allButton.tap()
        
        let button = app.navigationBars["TestExample4.Display"].buttons["Навигация"]
        button.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Изменить"]/*[[".cells.staticTexts[\"Изменить\"]",".staticTexts[\"Изменить\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let textField3 = tablesQuery2.cells.containing(.button, identifier:"Найти").children(matching: .textField).element
        textField3.tap()
        key2.tap()
        key3.tap()
        key2.tap()
        key4.tap()
        textField3.tap()
        
        let button2 = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Найти"]/*[[".cells.buttons[\"Найти\"]",".buttons[\"Найти\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button2.tap()
        button2.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["профессор"]/*[[".cells.textFields[\"профессор\"]",".textFields[\"профессор\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["д"]/*[[".keyboards.keys[\"д\"]",".keys[\"д\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        key2.tap()
        key3.tap()
        key5.tap()
        app2/*@START_MENU_TOKEN@*/.keys["н"]/*[[".keyboards.keys[\"н\"]",".keys[\"н\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["и"]/*[[".keyboards.keys[\"и\"]",".keys[\"и\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["к"]/*[[".keyboards.keys[\"к\"]",".keys[\"к\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.textFields["155"].tap()
        key7.tap()
        app2/*@START_MENU_TOKEN@*/.keys["0"]/*[[".keyboards.keys[\"0\"]",".keys[\"0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let navigationBar2 = app.navigationBars["Изменение"]
        navigationBar2.buttons["Save"].tap()
        navigationBar2.buttons["Навигация"].tap()
        staticText.tap()
        activeButton.tap()
        nonactiveButton.tap()
        allButton.tap()
        button.tap()
        
    }

}

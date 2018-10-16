//
//  ChangeViewController.swift
//  TestExample4
//
//  Created by Владимир on 16/10/2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import UIKit

class ChangeViewController: UITableViewController {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var postField: UITextField!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var wageField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var selectedEmployee: [String: Any]?
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        if UserDefaults.getPeopleList() == nil {
            showShortAlert(message: "Список пуст!")
            searchField.isEnabled = false
        } else {
            searchField.isEnabled = true
        }
        
    }
    
    

    fileprivate func searchCheck() -> Bool{
        if searchField.text == "" {
            showShortAlert(message: "Введите имя сотрудника!")
            return false
        }
        
        let emploeeArray = UserDefaults.getPeopleList()!
        
        for i in 0..<emploeeArray.count {
            if (emploeeArray[i]["name"] as! String) == searchField.text {
                selectedEmployee = emploeeArray[i]
                selectedIndex = i
            }
        }
        
        if selectedEmployee == nil {
            showShortAlert(message: "Сотрудника с таким именем нет!")
            return false
        }
        postField.placeholder = (selectedEmployee!["post"]! as! String)
        statusSwitch.isOn = (selectedEmployee!["status"]! as! Bool)
        wageField.placeholder = String(selectedEmployee!["wage"]! as! UInt)
        saveButton.isEnabled = true
        return true
    }
    
    @IBAction func searchAction(_ sender: Any) {
        searchCheck()
    }
    

    
    
    fileprivate func saveCheck() -> Bool {
        if postField.text == "" {
            showShortAlert(message: "Заполните поле должность!")
            return false
        }
        if wageField.text == "" {
            showShortAlert(message: "Заполните поле зарплата!")
            return false
        }
        
        selectedEmployee!["post"] = postField.text
        selectedEmployee!["status"] = statusSwitch.isOn
        selectedEmployee!["wage"] = UInt(wageField.text!)!
        
        var employee = UserDefaults.getPeopleList()!
        employee[selectedIndex!] = selectedEmployee!
        UserDefaults.standard.set(employee, forKey: "peopleList")
        
        postField.text = ""
        wageField.text = ""
        
        showShortAlert(message: "Изменение успешно!")
        return true
    }
    
    @IBAction func saveAction(_ sender: Any) {
        saveCheck()
    }
    
    func showShortAlert(message: String) {
        let alertController = UIAlertController(title: message, message:
            nil, preferredStyle: UIAlertController.Style.actionSheet)
            
        self.present(alertController, animated: true, completion: nil)
        let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
            alertController.dismiss(animated: true, completion: nil)
        })
    }
}

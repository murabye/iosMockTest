//
//  ChangeViewController.swift
//  TestExample4
//
//  Created by Владимир on 16/10/2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import UIKit
import CoreData

class ChangeViewController: UITableViewController {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var postField: UITextField!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var wageField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var selectedEmployee: Person?
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        
        var emploeeArray: [Person] = []
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        do{
            emploeeArray = try PersistenceService.context.fetch(request)
        } catch {
            showShortAlert(message: "Список пуст!")
            searchField.isEnabled = false
        }
        
        if emploeeArray.count < 1 {
            showShortAlert(message: "Список пуст!")
            searchField.isEnabled = false
        } else {
            searchField.isEnabled = true
        }
        
    }
    
    

    func searchCheck() -> Bool{
        if searchField.text == "" {
            showShortAlert(message: "Введите имя сотрудника!")
            return false
        }
        
        var emploeeArray: [Person] = []
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        do{
            emploeeArray = try PersistenceService.context.fetch(request)
        } catch {}
        
        
        
        for i in 0..<emploeeArray.count {
            if emploeeArray[i].name == searchField.text {
                selectedEmployee = emploeeArray[i]
                selectedIndex = i
            }
        }
        
        if selectedEmployee == nil {
            showShortAlert(message: "Сотрудника с таким именем нет!")
            return false
        }
        postField.placeholder = selectedEmployee?.post
        statusSwitch.isOn = (selectedEmployee?.status)!
        wageField.placeholder = String((selectedEmployee?.wage)!)
        saveButton.isEnabled = true
        return true
    }
    
    @IBAction func searchAction(_ sender: Any) {
        searchCheck()
        
        
    }
    

    
    
    func saveCheck() -> Bool {
       // precondition(postField.text == "", "Поле профессии пустое")
       // precondition(wageField.text == "", "Поле зарплата пустое")
        
        guard let name = wageField.text else {
            print("Поле зарплата пустое")
            return false
        }
        
        if postField.text == "" {
            showShortAlert(message: "Заполните поле должность!")
            return false
        }
        if wageField.text == "" {
            showShortAlert(message: "Заполните поле зарплата!")
            return false
        }
        
        selectedEmployee?.post = postField.text
        selectedEmployee?.status = statusSwitch.isOn
        selectedEmployee?.wage = Int64(wageField.text!)!
        
        PersistenceService.saveContext()
        
        postField.text = ""
        wageField.text = ""
        
        showShortAlert(message: "Изменение успешно!")
        return true
    }
    
    @IBAction func saveAction(_ sender: Any) {
        assert(saveCheck(), "Сохранение не успешно")
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

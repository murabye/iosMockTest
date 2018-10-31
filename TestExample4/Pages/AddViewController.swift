//
//  AddViewController.swift
//  TestExample4
//
//  Created by Владимир on 16/10/2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import UIKit

class AddViewController: UITableViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var postField: UITextField!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var wageField: UITextField!
    @IBOutlet weak var expSwitch: UISwitch!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func saveCheck() -> Bool {
        if nameField.text == "" {
            showShortAlert(message: "Заполните поле имя!")
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
        
        let employee = Person(context: PersistenceService.context)
        employee.name = nameField.text!
        employee.post = postField.text!
        employee.status = statusSwitch.isOn
        employee.wage = Int64(wageField.text!) ?? 0
        precondition(employee.wage >= 0, "Зарплата меньше 0")
        employee.exp = expSwitch.isOn
        precondition((employee.startDate! as Date) <= Date(), "Устройство в будущем")
        employee.startDate = startDatePicker.date as NSDate

        PersistenceService.saveContext()
        
        showShortAlert(message: "Сохранено!")
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

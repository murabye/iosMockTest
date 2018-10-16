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
    @IBAction func saveAction(_ sender: Any) {
        if nameField.text == "" {
            showShortAlert(message: "Заполните поле имя!")
            return
        }
        if postField.text == "" {
            showShortAlert(message: "Заполните поле должность!")
            return
        }
        if wageField.text == "" {
            showShortAlert(message: "Заполните поле зарплата!")
            return
        }
        let emploee = [
            "name" : nameField.text!,
            "post" : postField.text!,
            "status" : statusSwitch.isOn,
            "wage" : UInt(wageField.text!) ?? 0,
            "haveExp" : expSwitch.isOn,
            "startDate" : startDatePicker.date
            ] as [String : Any]

        if UserDefaults.standard.value(forKey: "peopleList") != nil {
            var arrayEpmloee = UserDefaults.standard.value(forKey: "peopleList") as! [[String: Any]]
            arrayEpmloee.append(emploee)
            UserDefaults.standard.set(arrayEpmloee, forKey: "peopleList")
        } else {
            UserDefaults.standard.set([emploee], forKey: "peopleList")
        }
        showShortAlert(message: "Сохранено!")
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
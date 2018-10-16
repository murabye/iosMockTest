//
//  RegistrationController.swift
//  TestExample4
//
//  Created by Вова Петров on 01.10.2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func register(_ sender: Any) {
        if loginField.text == nil {
            return
        }
        if passwordField.text == nil {
            return
        }
        if confirmPasswordField.text == nil {
            return
        }
        
        if register(login: loginField.text!,
                    password: passwordField.text!,
                    confirmPassword: confirmPasswordField.text!) {
            let alertController = UIAlertController(title: "Готово!", message:
                nil, preferredStyle: UIAlertController.Style.actionSheet)
            
            self.present(alertController, animated: true, completion: nil)
            let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                alertController.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    func register (login : String, password: String, confirmPassword: String) -> Bool {
        if login != "" {
            if password != "" && password == confirmPassword {
                UserDefaults.standard.setValue(password, forKey: login)
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }


}

//
//  ViewController.swift
//  TestExample4
//
//  Created by Вова Петров on 01.10.2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import UIKit

class SignVC: UIViewController {
    @IBOutlet weak var loginLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var appleImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func enterCheck() -> Bool {
        if loginLabel.text == nil || passwordLabel.text == "" {
            return false
        }
        if passwordLabel.text == nil || passwordLabel.text == "" {
            return false
        }
        if (UserDefaults.standard.value(forKey: loginLabel.text!) as? String) == passwordLabel.text! {
            UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
                self.appleImg.frame.size.height += 5
                self.appleImg.tintColor = UIColor.green
            }, completion: nil)
            
            _ = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false, block: { (_) in
                self.performSegue(withIdentifier: "Enter", sender: nil)
            })
            return true
        } else {
            UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
                self.appleImg.frame.size.height += 20
                self.appleImg.tintColor = UIColor.red
            }, completion: nil)
            UIView.animate(withDuration: 0.25, delay: 0.3, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
                self.appleImg.frame.size.height -= 20
                self.appleImg.tintColor = UIColor.black
            }, completion: nil)
        }
        return false
    }
    
    @IBAction func closeKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    @IBAction func enterAction(_ sender: Any) {
        enterCheck()
    }
    
}


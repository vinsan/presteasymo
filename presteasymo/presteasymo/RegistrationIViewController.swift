//
//  ViewController.swift
//  presteasymo
//
//  Created by Vincenzo Santoro on 03/04/2017.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

class RegistrationIViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "specialità" {
            
            let reg = Registrazione()
            let user = reg.inserisciNewUser(name: name.text!, surname: surname.text!, city: city.text!, email: mail.text!, password: password.text!)
            
            let nextWindow = segue.destination as! RegistrationIIViewController
            
            nextWindow.user = user!
            nextWindow.reg = reg
            
            
        }
    }


}


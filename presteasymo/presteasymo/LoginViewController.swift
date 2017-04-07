//
//  LoginViewController.swift
//  presteasymo
//
//  Created by Pietro Russo on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var reg = Registrazione()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logged" {
            
            
            
        }
    }
}

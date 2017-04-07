//
//  RegistrationIIViewController.swift
//  presteasymo
//
//  Created by Pietro Russo on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class RegistrationIIViewController: UIViewController {

    
    @IBOutlet weak var batteria: UISlider!
    @IBOutlet weak var chitarra: UISlider!
    @IBOutlet weak var basso: UISlider!
    @IBOutlet weak var canto: UISlider!
    @IBOutlet weak var tastiera: UISlider!
    
    var reg=Registrazione()
    var user=User()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registered" {
            
            reg.newUserAbility(ability: "Batteria", voto: 5, user: user)
            reg.newUserAbility(ability: "Canto", voto: 2, user: user)
            
            let nextWindow = segue.destination as! ProfileViewController
            
            nextWindow.user = user
            nextWindow.isLogged = true
            
        }
    }
    
}

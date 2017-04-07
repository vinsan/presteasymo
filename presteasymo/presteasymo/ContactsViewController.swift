//
//  ContactsViewController.swift
//  presteasymo
//
//  Created by Pietro Russo on 07/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    var user=User()
    
    @IBOutlet weak var istruzione: UILabel!
    @IBOutlet weak var indirizzo: UILabel!
    @IBOutlet weak var cellulare: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var youtube: UILabel!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //
        //Riempi i campi di info e contatti
        //
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

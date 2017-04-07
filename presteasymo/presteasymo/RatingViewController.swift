//
//  RatingViewController.swift
//  presteasymo
//
//  Created by Pietro Russo on 07/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {

    var user=User()
    
    @IBOutlet weak var batteria: UIImageView!
    @IBOutlet weak var chitarra: UIImageView!
    @IBOutlet weak var basso: UIImageView!
    @IBOutlet weak var canto: UIImageView!
    @IBOutlet weak var tastiera: UIImageView!
    @IBOutlet weak var affidabilità: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //
        //Riempi le stelline
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

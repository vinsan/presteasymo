//
//  ProfileViewController.swift
//  presteasymo
//
//  Created by Pietro Russo on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var isLogged = false
    

    @IBOutlet weak var namesurname: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var genre: UILabel!
    
    @IBOutlet weak var ratings: UIView!
    @IBOutlet weak var media: UIView!
    @IBOutlet weak var contacts: UIView!
    
    @IBAction func segControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        
        case 0 :
            ratings.isHidden = false
            media.isHidden = true
            contacts.isHidden = true
        case 1:
            ratings.isHidden = true
            media.isHidden = false
            contacts.isHidden = true
        case 2:
            ratings.isHidden = true
            media.isHidden = true
            contacts.isHidden = false
        default: break;
        }
    }
    
    
    var user=User()
    
    override func viewWillAppear(_ animated: Bool) {
        if (isLogged) {
            navigationItem.hidesBackButton = true
        }
        namesurname.text = user.name! + " " + user.surname!
        city.text = user.city!
//        genre.text = user.userGenre?.allObjects[0] as? String
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        
        case "ratings"?:
            
            let nextWindow = segue.destination as! RatingViewController
            nextWindow.user = user
        
        case "contacts"?:
            
            let nextWindow = segue.destination as! ContactsViewController
            nextWindow.user = user
        
        default:
            break;
            
        }
    }
}

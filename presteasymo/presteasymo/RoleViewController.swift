//
//  RoleViewController.swift
//  presteasymo
//
//  Created by Pietro Russo on 07/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class RoleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = ["Drums","Guitar","Singer","Bass","Keyboard","All"]
    
    let coredata = CoreDataController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailUser" {
            
            let i = picker.selectedRow(inComponent: 0)
            let ruolo = pickerData[i]
            let utenti: [User] = coredata.cercaRoleUser(role: ruolo)!
            
            let nextWindow = segue.destination as! ResearchUserViewController
            nextWindow.utenti = utenti
        }
    }
    
    
    
}

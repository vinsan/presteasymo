//
//  GenreViewController.swift
//  presteasymo
//
//  Created by Pietro Russo on 07/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    var pickerData: [String] = ["Rock","Pop","Jazz","Funky","Metal","All"]
    
    let coredata = CoreDataController()

    
    @IBOutlet weak var picker: UIPickerView!
    
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
        if segue.identifier == "detailBand" {
            
            let i = picker.selectedRow(inComponent: 0)
            let genere = pickerData[i]
            let bands: [Band] = coredata.cercaBandGenre(genre: genere)!
            
            let nextWindow = segue.destination as! ResearchBandViewController
            nextWindow.bands = bands
        }
    }

}

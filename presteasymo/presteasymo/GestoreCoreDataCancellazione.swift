//
//  GestoreCoreDataCancellazione.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit
import CoreData
class GestoreCoreDataCancellazione: NSObject {
    private let gest2: CoreDataController=CoreDataController()
    
    
    func cancellaUtente(user:User){
        let context = gest2.getContext()
        context.delete(user)
        do{
            try context.save()
        }
        catch let error as NSError{
            print("errore di cancellazione \(error.code)")
        }
    }
    
    
    func cancellaBand(band:Band){
        let context = gest2.getContext()
        context.delete(band)
        do{
            try context.save()
        }
        catch let error as NSError{
            print("errore di cancellazione \(error.code)")
        }
    }
}

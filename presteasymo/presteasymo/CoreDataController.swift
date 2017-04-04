//
//  CoreDataController.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 04/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit
import CoreData
import Foundation

/*
   questa classe si occupa di interagire con il model ed effettua tutte le 
    operazioni di prelievo, salvataggio e cancellazione sul model creato
 */
class CoreDataController: NSObject {
    static let user: String = "User"
    static let evalutation: String = "Evalutation"
    static let plays: String = "PlayBand"
    static let band: String = "Band"
    static let role: String = "Role"
    
    /*recuperiamo il context dell'applicazione mettendolo in comunicazione con il model inserendogli
     i dati e facendo operazioni
     */
    static func getContext()-> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
     /*
     metodo utilizzato per salvare i dati sul model
     */
    static func saveContext(){
        let context=getContext()
        do{
            try context.save()
        }
        catch let error as NSError{
            print("error saveContext \(error.code)")
        }
    }
}

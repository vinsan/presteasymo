//
//  CoreDataManager.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 04/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit
import CoreData
import Foundation

/*questa classe viene utilizzata per la gestione del database inserito
    con le relative operazioni di prelievo, salvataggio e cancellazione
 */
 
class CoreDataManager: NSObject {
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
    /*
    /*
     metodo utilizzato per prelevare i dati
     */
    static func fetchData()-> [Utente]{
        let context=getContext()
        var utenti=[Utente]()
        let fetchRequest = NSFetchRequest<Utente>(entityName: name)
        do{
            try utenti=context.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("error Request \(error.code)")
        }
        return utenti
    }
   
    /*
     metodo utilizzato per cancellare i dati sul model
     */
    static func delete( item: Utente){
        let context = getContext()
        context.delete(item)
    }
 
 */


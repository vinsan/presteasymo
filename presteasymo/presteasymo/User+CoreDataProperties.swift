//
//  User+CoreDataProperties.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 04/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var surname: String?
    @NSManaged public var name: String?
    @NSManaged public var idUser: Int32
    @NSManaged public var cityArea: String?
    @NSManaged public var userPhoto: String?
    @NSManaged public var valutationUser: NSSet?
    @NSManaged public var roleUser: NSSet?
    @NSManaged public var playerBand: NSSet?
    
    //aggiunge una valutazione nell'array delle valutazioni
    func addEvalutation(value: Evalutation){
        /*qui utilizziamo un metodo di NSManagedObject per rendere NSSet mutabile in quanto NSSet non è mutabile
           come parametro gli passiamo il nome del NSSet da utilizzare
        */
        let items = self.mutableSetValue(forKey: "valutationUser")
        //qui aggiungiamo il metodo
        items.add(value)
    }
    //rimuove una valutazione dall'array
    func removeEvalutation(value: Evalutation){
        let items = self.mutableSetValue(forKey: "valutationUser")
        items.remove(value)
    }
    
    
    func addRole(value: Role){
        let items = self.mutableSetValue(forKey: "roleUser")
        items.add(value)
    }
    func removeRole(value: Role){
        let items = self.mutableSetValue(forKey: "roleUser")
        items.remove(value)
    }
    
    
    func addPlayerBand(value: PlayBand){
        let items = self.mutableSetValue(forKey: "playerBand")
        items.add(value)
    }
    func removePlayerBand(value: PlayBand){
        let items = self.mutableSetValue(forKey: "playerBand")
        items.remove(value)
    }
    
}


/*
// MARK: Generated accessors for valutationUser
extension User {

    @objc(addValutationUserObject:)
    @NSManaged public func addToValutationUser(_ value: Evalutation)

    @objc(removeValutationUserObject:)
    @NSManaged public func removeFromValutationUser(_ value: Evalutation)

    @objc(addValutationUser:)
    @NSManaged public func addToValutationUser(_ values: NSSet)

    @objc(removeValutationUser:)
    @NSManaged public func removeFromValutationUser(_ values: NSSet)

}

// MARK: Generated accessors for roleUser
extension User {

    @objc(addRoleUserObject:)
    @NSManaged public func addToRoleUser(_ value: Role)

    @objc(removeRoleUserObject:)
    @NSManaged public func removeFromRoleUser(_ value: Role)

    @objc(addRoleUser:)
    @NSManaged public func addToRoleUser(_ values: NSSet)

    @objc(removeRoleUser:)
    @NSManaged public func removeFromRoleUser(_ values: NSSet)

}

// MARK: Generated accessors for playerBand
extension User {

    @objc(addPlayerBandObject:)
    @NSManaged public func addToPlayerBand(_ value: PlayBand)

    @objc(removePlayerBandObject:)
    @NSManaged public func removeFromPlayerBand(_ value: PlayBand)

    @objc(addPlayerBand:)
    @NSManaged public func addToPlayerBand(_ values: NSSet)

    @objc(removePlayerBand:)
    @NSManaged public func removeFromPlayerBand(_ values: NSSet)
 
}
*/

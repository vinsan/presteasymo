//
//  User+CoreDataProperties.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var city: String?
    @NSManaged public var education: String?
    @NSManaged public var email: String?
    @NSManaged public var idUs: String?
    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var youtube: String?
    @NSManaged public var userPhoto: String?
    @NSManaged public var contactNumber: String?
    @NSManaged public var username: String?
    @NSManaged public var password: String?
    
    @NSManaged public var userGenre: NSSet?
    @NSManaged public var feedbackUser: NSSet?
    @NSManaged public var memberShip: NSSet?
    @NSManaged public var userAbility: NSSet?
    
    //metodi per aggiungere e rimuovere gli elementi dall'array
    func addGenere(value: Genre) {
        //qui prendiamo l'nset per renderlo non mutabile
        let items = self.mutableSetValue(forKey: "userGenre")
        items.add(value)
    }
    func removeGenere(value: Genre) {
        let items = self.mutableSetValue(forKey: "userGenre")
        items.remove(value)
    }
    //aggiungi e rimuovi membro
    func addMembro(value: Member) {
        let items = self.mutableSetValue(forKey: "memberShip")
        items.add(value)
    }
    func removeMembro(value:Member) {
        let items = self.mutableSetValue(forKey: "memberShip")
        items.remove(value)
    }
    //aggiungi e rimuovi feedback
    func addValutazione(value: Feedback) {
        let items = self.mutableSetValue(forKey: "feedbackUser")
        items.add(value)
    }
    func removeValutazione(value: Feedback) {
        let items = self.mutableSetValue(forKey: "feedbackUser")
        items.remove(value)
    }
    //aggiungi e rimuovi userAbility
    func addAbility(value: Ability) {
        let items = self.mutableSetValue(forKey: "userAbility")
        items.add(value)
    }
    func removeAbility(value: Ability) {
        let items = self.mutableSetValue(forKey: "userAbility")
        items.remove(value)
    }
    
}

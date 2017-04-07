//
//  Band+CoreDataProperties.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData


extension Band {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Band> {
        return NSFetchRequest<Band>(entityName: "Band")
    }

    @NSManaged public var city: String?
    @NSManaged public var idBan: String?
    @NSManaged public var name: String?
    @NSManaged public var bandPhoto: String?
    @NSManaged public var youtubeChannel: String?
    @NSManaged public var contactNumber: String?
    @NSManaged public var genre: NSSet?
    @NSManaged public var bandMember: NSSet?
    
    //aggiung e rimuovi genere
    func addGenereBand(value: Genre) {
        let items = self.mutableSetValue(forKey: "genre")
        items.add(value)
    }
    func removeGenereBand(value: Genre) {
        let items = self.mutableSetValue(forKey: "genre")
        items.remove(value)
    }
    //aggiungi e rimuovi membro
    func addMembroBand(value: Member) {
        let items = self.mutableSetValue(forKey: "bandMember")
        items.add(value)
    }
    func removeMembroBand(value:Member) {
        let items = self.mutableSetValue(forKey: "bandMember")
        items.remove(value)
    }
}


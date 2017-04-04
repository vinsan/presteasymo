//
//  Band+CoreDataProperties.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 04/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData

/*
 in questa classe abbiamo una relazione "uno a molti" che sono rappresentate
 tramite array o NSSet, dove NSSet è l'equivalente di let array: [AnyObject]
 Questo array contiene oggetti di NSManagedObject
 */
extension Band {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Band> {
        return NSFetchRequest<Band>(entityName: "Band")
    }

    @NSManaged public var areaCity: String?
    @NSManaged public var bandPhoto: String?
    @NSManaged public var genre: String?
    @NSManaged public var idBand: String?
    @NSManaged public var name: String?
    @NSManaged public var playAsBand: NSSet?
    
    func addPlayBand(value: PlayBand){
        let items = self.mutableSetValue(forKey: "playAsBand")
        items.add(value)
    }
    func removePlayBand(value: PlayBand){
        let items = self.mutableSetValue(forKey: "playAsBand")
        items.remove(value)
    }

}
/*
// MARK: Generated accessors for playAsBand
extension Band {

    @objc(addPlayAsBandObject:)
    @NSManaged public func addToPlayAsBand(_ value: PlayBand)

    @objc(removePlayAsBandObject:)
    @NSManaged public func removeFromPlayAsBand(_ value: PlayBand)

    @objc(addPlayAsBand:)
    @NSManaged public func addToPlayAsBand(_ values: NSSet)

    @objc(removePlayAsBand:)
    @NSManaged public func removeFromPlayAsBand(_ values: NSSet)

}
 */

//
//  PlayBand+CoreDataProperties.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 04/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData


extension PlayBand {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayBand> {
        return NSFetchRequest<PlayBand>(entityName: "PlayBand")
    }

    @NSManaged public var idComponent: Int32
    @NSManaged public var leaderMember: Bool
    @NSManaged public var band: Band?
    @NSManaged public var roleInTheBand: NSSet?
    @NSManaged public var user: User?
    
    func addroleInTheBand(value: Role){
        let items = self.mutableSetValue(forKey: "roleInTheBand")
        items.add(value)
    }
    func removeroleInTheBand(value: Role){
        let items = self.mutableSetValue(forKey: "roleInTheBand")
        items.remove(value)
    }

}
/*
// MARK: Generated accessors for roleInTheBand
extension PlayBand {

    @objc(addRoleInTheBandObject:)
    @NSManaged public func addToRoleInTheBand(_ value: Role)

    @objc(removeRoleInTheBandObject:)
    @NSManaged public func removeFromRoleInTheBand(_ value: Role)

    @objc(addRoleInTheBand:)
    @NSManaged public func addToRoleInTheBand(_ values: NSSet)

    @objc(removeRoleInTheBand:)
    @NSManaged public func removeFromRoleInTheBand(_ values: NSSet)

}
 */

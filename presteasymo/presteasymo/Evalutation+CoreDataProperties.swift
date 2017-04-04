//
//  Evalutation+CoreDataProperties.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 04/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData


extension Evalutation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Evalutation> {
        return NSFetchRequest<Evalutation>(entityName: "Evalutation")
    }

    @NSManaged public var idValutation: Int32
    @NSManaged public var instrumentalSkills: Int32
    @NSManaged public var reliability: Int32
    @NSManaged public var userValutation: User?

}

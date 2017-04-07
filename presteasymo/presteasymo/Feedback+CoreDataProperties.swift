//
//  Feedback+CoreDataProperties.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData


extension Feedback {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Feedback> {
        return NSFetchRequest<Feedback>(entityName: "Feedback")
    }

    @NSManaged public var evalutation: Int32
    @NSManaged public var user: User?
    @NSManaged public var ability: Ability?
    
}

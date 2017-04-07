//
//  Ability+CoreDataProperties.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData


extension Ability {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ability> {
        return NSFetchRequest<Ability>(entityName: "Ability")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var feedBack: Feedback?
    @NSManaged public var user: User?

}

//
//  Role+CoreDataProperties.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 04/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData


extension Role {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Role> {
        return NSFetchRequest<Role>(entityName: "Role")
    }

    @NSManaged public var genre: String?
    @NSManaged public var idRole: Int32
    @NSManaged public var instrumentalRole: String?
    @NSManaged public var playInBand: PlayBand?
    @NSManaged public var user: User?
   

}

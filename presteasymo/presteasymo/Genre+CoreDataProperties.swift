//
//  Genre+CoreDataProperties.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData


extension Genre {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Genre> {
        return NSFetchRequest<Genre>(entityName: "Genre")
    }

    @NSManaged public var idGenre: String?
    @NSManaged public var name: String?
    @NSManaged public var bandGenre: Band?
    @NSManaged public var userGenre: User?

}

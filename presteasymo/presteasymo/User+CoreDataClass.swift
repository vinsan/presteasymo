//
//  User+CoreDataClass.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 04/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import Foundation
import CoreData


public class User: NSManagedObject {
    override public init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

}

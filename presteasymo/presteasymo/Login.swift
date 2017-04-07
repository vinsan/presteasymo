//
//  Login.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class Login: NSObject {
    var gestoreprelievi:GestoreCoreDataPrelievo=GestoreCoreDataPrelievo()
    var gestAccess: CoreDataController=CoreDataController()
    
    func login(username: String,password:String)->User?{
        let users=gestoreprelievi.getUser()
        for utente in users{
            if((utente.username!==username)&&(utente.password!==password)){
                return utente
            }
        }
        return nil
    }
}

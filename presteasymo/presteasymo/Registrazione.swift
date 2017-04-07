//
//  Registrazione.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class Registrazione: NSObject {
    let gest1=CoreDataController()
    let gest2=GestoreCoreDataPrelievo()
    
    func inserisciNewUser(name: String, surname: String, city: String, email: String, password:String)->User?{
        let utenti=gest2.getUser()
        for ut in utenti{
            if(ut.email! == email){
                return nil
            }
        }
        gest1.creaUser(name: name, surname: surname, city: city, email: email, password: password)
        let user=gest1.cercaUser(id: email)
        return user
    }
    
    func newUserAbility(ability: String, voto: Int32, user:User){
        let ab=gest1.creaAbility(name: ability)
        let feedback=gest1.creaFeedBack(voto: voto, utente: user, ability: ab)
        gest1.addFeedBackAdUtente(utente: user, feedback: feedback)
    }
}

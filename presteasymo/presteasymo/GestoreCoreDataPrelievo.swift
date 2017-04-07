//
//  GestoreCoreDataPrelievo.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit
import CoreData
class GestoreCoreDataPrelievo: NSObject {
    private let gest: CoreDataController=CoreDataController()
    
    //preleviamo i dati dell utente
    func getUser()->[User]{
        var utenti=[User]()
        let fetchRequest: NSFetchRequest<User>=User.fetchRequest()
        do{
            try utenti=gest.getContext().fetch(fetchRequest)
        }
        catch let error as NSError{
            print("error Request \(error.code)")
        }
        return utenti
    }
    
    //preleviamo i dati della band
    func getBand()->[Band]{
        var item=[Band]()
        let fetchRequest: NSFetchRequest<Band>=Band.fetchRequest()
        do{
            try item=gest.getContext().fetch(fetchRequest)
        }
        catch let error as NSError{
            print("error Request \(error.code)")
        }
        return item
    }
    
    //preleviamo i dati feedback
    func getFeedBack()->[Feedback]{
        var item=[Feedback]()
        let fetchRequest: NSFetchRequest<Feedback>=Feedback.fetchRequest()
        do{
            try item=gest.getContext().fetch(fetchRequest)
        }
        catch let error as NSError{
            print("error Request \(error.code)")
        }
        return item
    }
    
    //preleviamo i dati ability
    func getAbility()->[Ability]{
        var item=[Ability]()
        let fetchRequest: NSFetchRequest<Ability>=Ability.fetchRequest()
        do{
            try item=gest.getContext().fetch(fetchRequest)
        }
        catch let error as NSError{
            print("error Request \(error.code)")
        }
        return item
    }
    
    //preleviamo i dati membri
    func getMembers()->[Member]{
        var item=[Member]()
        let fetchRequest: NSFetchRequest<Member>=Member.fetchRequest()
        do{
            try item=gest.getContext().fetch(fetchRequest)
        }
        catch let error as NSError{
            print("error Request \(error.code)")
        }
        return item
    }
    
    //preleviamo i dati genere
    func getGenre()->[Genre]{
        var item=[Genre]()
        let fetchRequest: NSFetchRequest<Genre>=Genre.fetchRequest()
        do{
            try item=gest.getContext().fetch(fetchRequest)
        }
        catch let error as NSError{
            print("error Request \(error.code)")
        }
        return item
    }
    
    //preleviamo i dati ruolo
    func getRole()->[Role]{
        var item=[Role]()
        let fetchRequest: NSFetchRequest<Role>=Role.fetchRequest()
        do{
            try item=gest.getContext().fetch(fetchRequest)
        }
        catch let error as NSError{
            print("error Request \(error.code)")
        }
        return item
    }
    
    
    
    
    //preleviamo i dati dei feedback dell'utente
    func getFeedBackUser(user: User)->[Feedback]{
        var item=[Feedback]()
        item = user.feedbackUser?.allObjects as! [Feedback]
        return item
    }
    //preleviamo il genere dell'utente
    func getGenereUser(user: User)->[Genre]{
        var item=[Genre]()
        item = user.userGenre?.allObjects as! [Genre]
        return item
    }
    //preleviamo i membri dall'utente
    func getBandMembroUser(user: User)->[Member]{
        var item=[Member]()
        item = user.memberShip?.allObjects as! [Member]
        return item
    }
    //preleviamo il membro dall'utente
    func getAbilityUser(user: User)->[Ability]{
        var item=[Ability]()
        item = user.userAbility?.allObjects as! [Ability]
        return item
    }
    //preleviamo il genere dalla Band
    func getGenereBand(user: Band)->[Genre]{
        var item=[Genre]()
        item = user.genre?.allObjects as! [Genre]
        return item
    }
    //preleviamo il membro dalla Band
    func getMembroBand(user: Band)->[Member]{
        var item=[Member]()
        item = user.bandMember?.allObjects as! [Member]
        return item
    }
}

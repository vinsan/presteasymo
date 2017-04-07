//
//  CoreDataController.swift
//  presteasymo
//
//  Created by Fabio Mazzotta on 06/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit
import CoreData
class CoreDataController{
    
    func getContext()->NSManagedObjectContext{
        /*recuperiamo il context dell'applicazione mettendolo in comunicazione con il model inserendogli
         i dati e facendo operazioni
         */
        let application = UIApplication.shared.delegate as! AppDelegate
        return application.persistentContainer.viewContext
    }
    /*
     metodo utilizzato per salvare i dati sul model
     */
    func saveContext(){
        do{
            try self.getContext().save()
        }
        catch let error as NSError{
            print("error saveContext \(error.code)")
        }
    }
    
    //Costruiamo le nostre entità
    func creaUser(name: String, surname: String, city: String, email: String, password:String){
        let newEntityItem=NSEntityDescription.entity(forEntityName: "User", in: self.getContext())
        let item=User(entity: newEntityItem!, insertInto: self.getContext())
        item.name=name
        item.surname=surname
        item.city=city
//        item.userPhoto=userPhoto
//        item.contactNumber=contactNumber
//        item.youtube=youtubeChannel
        item.idUs=email
//        item.education=education
        item.email=email
        item.password=password
        item.username=email
        self.saveContext()
    }
    func creaBandMember(leader: Bool,user: User,band: Band,ruolo: Role)->Member{
        let newEntityItem=NSEntityDescription.entity(forEntityName: "Member", in: self.getContext())
        let item=Member(entity: newEntityItem!, insertInto: self.getContext())
        item.leader=leader
        item.band=band
        item.user=user
        item.role=ruolo
        self.saveContext()
        return item
    }
    func creaBand(name:String, areaCity:String,contactNumber:String,youtubeChannel: String,bandPhoto: String,id: String){
        let newEntityItem=NSEntityDescription.entity(forEntityName: "Band", in: self.getContext())
        let item=Band(entity: newEntityItem!, insertInto: self.getContext())
        item.name=name
        item.bandPhoto=bandPhoto
        item.city=areaCity
        item.contactNumber=contactNumber
        item.youtubeChannel=youtubeChannel
        item.idBan=id
        self.saveContext()
    }
    func creaRole(id: String,name: String)->Role{
        let newEntityItem=NSEntityDescription.entity(forEntityName: "Role", in: self.getContext())
        let item=Role(entity: newEntityItem!, insertInto: self.getContext())
        item.name=name
        item.idRole=id
        self.saveContext()
        return item
    }
    func creaMusicalGeneral(name:String,id:String, utente: User, band: Band)->Genre{
        let newEntityItem=NSEntityDescription.entity(forEntityName: "Genre", in: self.getContext())
        let item=Genre(entity: newEntityItem!, insertInto: self.getContext())
        item.name=name
        item.idGenre=id
        item.bandGenre=band
        item.userGenre=utente
        self.saveContext()
        return item
    }
    func creaFeedBack(voto: Int32,utente:User,ability:Ability)->Feedback{
        let newEntityItem=NSEntityDescription.entity(forEntityName: "Feedback", in: self.getContext())
        let item=Feedback(entity: newEntityItem!, insertInto: self.getContext())
        item.evalutation=voto
        item.user=utente
        item.ability=ability
        self.saveContext()
        return item
    }
    func creaAbility(name: String)->Ability{
        let newEntityItem=NSEntityDescription.entity(forEntityName: "Ability", in: self.getContext())
        let item=Ability(entity: newEntityItem!, insertInto: self.getContext())
        item.name=name
        self.saveContext()
        return item
    }
    
    //usata ogni volta che inseriamo un utente verifichiamo se gìà esiste
    func cercaUser(id: String) -> User? {
        var item: User?
        let predicate = NSPredicate(format: "idUs = %@", id)
        let request : NSFetchRequest<User> = User.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate=predicate
        
        do {
            let result: NSArray = try self.getContext().fetch(request) as NSArray
            
            switch result.count {
            case 0:
                print("l'utente  non esiste!")
                print("Provvedo alla creazione")
                
                return nil
                
            case 1:
                print("l'utente è già in memoria")
                print("Recupero l'utente e lo restituisco")
                item = result[0] as? User
                return item
            default:
                return nil
            }
            
        } catch let error as NSError{
            print("Errore recupero informazioni dal context \n \(error.code)")
        }
        return nil
    }
    //Stessa cosa per Band
    func cercaBand(id: String) -> Band?{
        var item: Band?
        let predicate = NSPredicate(format: "idBan = %@", id)
        let request : NSFetchRequest<Band> = Band.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate=predicate
        do {
            let result: NSArray = try self.getContext().fetch(request) as NSArray
            
            switch result.count {
            case 0:
                print("La band non esiste!")
                return nil
            case 1:
                print("La Band  è già in memoria")
                print("Recupero la band e la restituisco")
                item = result[0] as? Band
                print("Valore di ritorno" )
                return item!
            default:
                return nil
            }
            
        } catch let error as NSError{
            print("Errore recupero informazioni dal context \n \(error.code))")
        }
        return nil
    }
    
    //metodo cerca ruolo ad utente
    func cercaRoleUser(role: String) -> [User]?{
        var item = [User]()
        let predicate = NSPredicate(format: "name = %@", role)
        let request : NSFetchRequest<Role> = Role.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate=predicate
        do {
            let result: NSArray = try self.getContext().fetch(request) as NSArray
            if(result.count>0){
                for i in 0...result.count-1{
                    print("ho trovato gli user")
                    let oneRole=result[i] as! Role
                    let membro=oneRole.roleBandMember
                    let user=membro?.user
                    item.append(user!)
                }
            }
            else{
                print("non c'è")
            }
            
        } catch let error as NSError{
            print("Errore recupero informazioni dal context \n \(error.code))")
        }
        return item
    }
    
    //metodo cerca band per genere
    func cercaBandGenre(genre: String) -> [Band]?{
        var item: [Band]?
        let predicate = NSPredicate(format: "name = %@", genre)
        let request : NSFetchRequest<Genre> = Genre.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate=predicate
        do {
            let result: NSArray = try self.getContext().fetch(request) as NSArray
            if(result.count>0){
                for i in 0...result.count-1{
                    let onegenre=result[i] as! Genre
                    let band=onegenre.bandGenre
                    item?.append(band!)
                }
            }
            else{
                print("non c'è")
                return nil
            }
            
        } catch let error as NSError{
            print("Errore recupero informazioni dal context \n \(error.code))")
        }
        return item
    }

    
    //qui settiamo i riferimenti estermi all 'utente
    func addFeedBackAdUtente(utente: User,feedback: Feedback){
        utente.addValutazione(value: feedback)
        self.saveContext()
    }
    func addAbilityAdUser(utente: User,valutazione:Ability){
        utente.addAbility(value: valutazione)
        self.saveContext()
    }
    func addLeaderAdUser(utente: User,genre: Genre){
        utente.addGenere(value: genre)
        self.saveContext()
    }
    func addMemberAdUser(utente: User,member: Member){
        utente.addMembro(value: member)
        self.saveContext()
    }
    //qui inseriamo i riferimenti alle band
    func addGenereABand(band:Band, genere:Genre){
        band.addGenereBand(value: genere)
        self.saveContext()
    }
    func addMembroABand(band:Band,membro:Member){
        band.addMembroBand(value: membro)
        self.saveContext()
    }

}

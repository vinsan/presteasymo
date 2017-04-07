//
//  AppDelegate.swift
//  presteasymo
//
//  Created by Vincenzo Santoro on 03/04/2017.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let gestCanc = GestoreCoreDataCancellazione()
    let gestPrel = GestoreCoreDataPrelievo()
    let gest1 = CoreDataController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if let tabBarController = self.window!.rootViewController as? UITabBarController {
            tabBarController.selectedIndex = 1
        }
        
        print("inseriamo una band ed un utente")
        
        //creaUser(name: String, surname: String, city: String, email: String, password:String)
        
        gest1.creaUser(name: "Marco", surname: "Rossi", city: "Avellino", email: "", password: "asd")
        gest1.creaUser(name: "Luca", surname: "Verdi", city: "Roma", email: "asd", password: "asd")
        gest1.creaUser(name: "Roberto", surname: "Neri", city: "Salerno", email: "asd", password: "asd")
        gest1.creaUser(name: "Matteo", surname: "Treo", city: "Sava", email: "asd", password: "asd")
        
        gest1.creaBand(name: "Pink floyd", areaCity: "roma", contactNumber: "789", youtubeChannel: "dfd", bandPhoto: "rerer", id: "pink")
        print("fatto ora li preleviamo")
        let ba=gestPrel.getBand()
        let ut=gestPrel.getUser()
        
        print("ora inseriamo un genere, feedback, abilità e membro ad utente ad una band")

        let user = ut[1]
        let band = ba[1]
        
        if(!(user==nil)){
            print("fatto 1")
            let ab=gest1.creaAbility(name: "Guitar")
            print("fatto 2")
            let role=gest1.creaRole(id: "Erer", name: "pianista")
            print("fatto 3")
            let fee=gest1.creaFeedBack(voto: 45, utente: user, ability: ab)
            print("fatto4")
            let genre=gest1.creaMusicalGeneral(name: "Rock", id: "erer", utente: user, band: band)
            print("fatto 5")
            let membro=gest1.creaBandMember(leader: false, user: user, band: band, ruolo: role)
            user.addAbility(value: ab)
            user.addGenere(value: genre)
            user.addMembro(value: membro)
            user.addValutazione(value: fee)
        }
        if(!(band==nil)){
            print("fatto 34")
            let ruolo3=gest1.creaRole(id: "trt", name: "Guitar")
            print("fatto 35")
            let membro1=gest1.creaBandMember(leader: true, user: user, band: band, ruolo: ruolo3)
            print("fatto 36")
            let genre3=gest1.creaMusicalGeneral(name: "jazz", id: "tyty", utente: user, band: band)
            print("fatto 37")
            band.addGenereBand(value: genre3)
            band.addMembroBand(value: membro1)
        }
        print("ora visualizziamo i contenuti inseriti nell'utente e nella band")
        let feeds=gestPrel.getFeedBackUser(user: user)
        let abs=gestPrel.getAbilityUser(user: user)
        let userMe=gestPrel.getBandMembroUser(user: user)
        let gens=gestPrel.getGenereUser(user: user)
        
        let genBand=gestPrel.getGenereBand(user: band)
        let membro=gestPrel.getMembroBand(user: band)
        
        for f1 in feeds{
            print("FeedBack " ,f1.evalutation , f1.user!.name! + f1.ability!.name!)
        }
        
        for f2 in abs{
            print("ability " + f2.name! + f2.user!.name!)
        }
        
        for f3 in userMe{
            print("UserMember " + f3.user!.name! + f3.role!.name!)
        }
        
        for f4 in gens{
            print("Genere " + f4.name! + f4.userGenre!.name! + f4.bandGenre!.name!)
        }
        
        for f5 in genBand{
            print("GenereBand " ,f5.name! + f5.bandGenre!.name!)
        }
        
        for f6 in membro{
            print("MembroBand" + f6.user!.name! + f6.role!.name!)
        }
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "presteasymo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}


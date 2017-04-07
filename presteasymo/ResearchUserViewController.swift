//
//  ResearchUserViewController.swift
//  presteasymo
//
//  Created by Pietro Russo on 07/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class ResearchUserViewController: UITableViewController {

    
    
    var utenti: [User] = [User]()
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return utenti.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserViewCell", for: indexPath) as! UserViewCell

        let user = utenti[indexPath.row]
        cell.name_surname.text = user.name! + user.surname!
        cell.city.text = user.city!
//      cell.genre.text = user.userGenre?.allObjects[0]
        
        let feedbacks: [Feedback] = user.feedbackUser?.allObjects as! [Feedback]
        var somma: Int = 0
        
        for v in feedbacks {
            
            somma += Int(v.evalutation)
        }
        
        let media = somma/feedbacks.count
        
        switch Int(media) {
        case 0:
            cell.stars.image = #imageLiteral(resourceName: "0stelle")
        case 1:
            cell.stars.image = #imageLiteral(resourceName: "1stelle")
        case 2:
            cell.stars.image = #imageLiteral(resourceName: "2stelle")
        case 3:
            cell.stars.image = #imageLiteral(resourceName: "3stelle")
        case 4:
            cell.stars.image = #imageLiteral(resourceName: "4stelle")
        case 5:
            cell.stars.image = #imageLiteral(resourceName: "5stelle")
            
        default: cell.stars.image = #imageLiteral(resourceName: "0stelle")
            
        }
        
        
        

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profiledetail" {
            
            let currentRow = tableView.indexPathForSelectedRow?.row
            let currentItem = utenti[currentRow!]
            
            let destView = segue.destination as! ProfileViewController
            
            destView.user = currentItem
            destView.isLogged = false
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ContactListTableViewController.swift
//  CloudKitAssessment
//
//  Created by Jeremiah Hawks on 2/24/17.
//  Copyright © 2017 Jeremiah Hawks. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController {
    
    @IBAction func reloadDataButtonTapped(_ sender: Any) {
        ContactController.shared.fetchAllContacts { 
            return
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContactController.shared.fetchAllContacts { 
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactController.shared.contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = ContactController.shared.contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowContactDetail"{
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let detailVC = segue.destination as? ContactDetailViewController else { return }
            let contact = ContactController.shared.contacts[indexPath.row]
            detailVC.contact = contact
            detailVC.editMode = true
        }
    }
}

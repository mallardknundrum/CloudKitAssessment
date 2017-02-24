//
//  ContactController.swift
//  CloudKitAssessment
//
//  Created by Jeremiah Hawks on 2/24/17.
//  Copyright © 2017 Jeremiah Hawks. All rights reserved.
//

import Foundation
import CloudKit

class ContactController {
    
    static let shared = ContactController()
    
    var contacts: [Contact] = []
    
    func createContact(withName: String, phoneNumber: String?, email: String?) {
        let contact = Contact(name: withName, phoneNumber: phoneNumber, email: email)
        CloudKitManager.shared.saveRecord(contact.cloudKitRecord) { (_, error) in
            if let error = error {
                print("There was a problem saving to the cloud. /n \(error.localizedDescription)")
            }
        }
        contacts.append(contact)
    }
    
    func fetchContact() {
    }
    
    func fetchAllContacts(completion: @escaping() -> Void) {
        CloudKitManager.shared.fetchAllContacts { (contacts) in
            self.contacts = contacts
            return
        }
    }
    
    func editContac() {
        
        
    }
}

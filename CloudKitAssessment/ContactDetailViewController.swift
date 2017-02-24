//
//  ContactDetailViewController.swift
//  CloudKitAssessment
//
//  Created by Jeremiah Hawks on 2/24/17.
//  Copyright © 2017 Jeremiah Hawks. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    var editMode: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshViews()

    }
    
    var contact: Contact? 

    @IBAction func saveButtonTapped(_ sender: Any) {
        if editMode == true {
            guard let recordID = contact?.CKRecordID else { return }
            CloudKitManager.shared.deleteRecordWithID(recordID, completion: { (recordID, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Successfully deleted record from cloud")
                    return
                }
            })
            guard let name = nameTextField.text else { return }
            ContactController.shared.createContact(withName: name, phoneNumber: phoneNumberTextField.text, email: emailTextField.text)
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
            self.editMode = false
            
        } else {
            guard let name = nameTextField.text else { return }
            ContactController.shared.createContact(withName: name, phoneNumber: phoneNumberTextField.text, email: emailTextField.text)
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
    
    func refreshViews() {
        guard let contact = contact else { return }
        self.nameTextField.text = contact.name
        self.emailTextField.text = contact.email
        self.phoneNumberTextField.text = contact.phoneNumber
        
        
    }
    

}

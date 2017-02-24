//
//  Contact.swift
//  CloudKitAssessment
//
//  Created by Jeremiah Hawks on 2/24/17.
//  Copyright © 2017 Jeremiah Hawks. All rights reserved.
//

import Foundation
import CloudKit

class Contact {
    
    private let nameKey = "name"
    private let phoneNumberKey = "phoneNumber"
    private let emailKey = "email"
    
    let name: String
    let phoneNumber: String?
    let email: String?
    let CKRecordID: CKRecordID?
    
    var cloudKitRecord: CKRecord {
        let record = CKRecord(recordType: "Contact")
        record.setValue(name, forKey: nameKey)
        record.setValue(phoneNumber, forKey: phoneNumberKey)
        record.setValue(email, forKey: emailKey)
        return record
    }
    
    init(name: String, phoneNumber: String? = nil, email: String? = nil){
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.CKRecordID = nil
    }
    
    init?(CKRecord: CKRecord) {
        guard let name = CKRecord[nameKey] as? String else { return nil }
        self.name = name
        self.email = CKRecord[emailKey] as? String
        self.phoneNumber = CKRecord[phoneNumberKey] as? String
        self.CKRecordID = CKRecord.recordID
    }
    
}

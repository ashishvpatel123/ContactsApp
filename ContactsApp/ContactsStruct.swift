//
//  ContactsStruct.swift
//  ContactsApp
//
//  Created by IMCS2 on 2/24/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import Foundation

struct ContactsStruct {
    var firstName : String
    var lastName : String
    var number : String
    var emailID : String
    
    init(firstName : String ,lastname : String, number : String , emailID : String) {
        self.firstName = firstName
        self.lastName = lastname
        self.number = number
        self.emailID = emailID
    }
}

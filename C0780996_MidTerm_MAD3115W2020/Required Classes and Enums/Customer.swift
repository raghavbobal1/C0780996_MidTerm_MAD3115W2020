//
//  Customer.swift
//  C0769778_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
import UIKit

class Customer
{
    var customerId: String
    var name: String?
    var email: String
    var userName: String
    var password: String?
    var mobileNumber: String
    var dob: String?

    init(customerId: String, name: String, email: String, userName: String, password: String,mobileNumber: String,dob:String?)
    {
        self.customerId = customerId
        self.name = name
        self.email = email
        self.userName = userName
        self.password = password
        self.mobileNumber = mobileNumber
        self.dob = dob
    }
    
}

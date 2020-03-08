//
//  Customer.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

public class Customer
{
    var customerId: String
    var name: String
    var emailId: String
    var password: String
    var mobileNumber:String
   

    init(customerId: String, name: String, emailId: String,mobileNumber:String, password:String)
          {
              self.customerId = customerId
              self.name = name
              self.mobileNumber = mobileNumber
              self.password = password
              self.emailId = emailId
           }
}

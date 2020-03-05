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
    var customerId: Int
    private var firstName: String
    private var lastName: String
    private var fullName: String
    {return "\(firstName) \(lastName)"}
    private var emailId: String
    private var mobileNumber:String
    var totalBill: Double
   
}

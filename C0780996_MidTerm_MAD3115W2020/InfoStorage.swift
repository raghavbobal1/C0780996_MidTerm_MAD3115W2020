
//
//  DataRepository.swift
//  C0769778_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
import UIKit


class DataRepository
{
   
static private var repoObj = DataRepository()
lazy var customerDictionary = Dictionary<String, Customer>()
    
private init(){
}

 
static func getInstance() -> DataRepository
{
return repoObj
}
    
func addCustomer(customer: Customer)
  {
    let cid = customer.customerId
    customerDictionary.updateValue(customer, forKey: cid)
  }

func loadData()
{
    let c1 =  Customer(customerId: "001", name: "Uday Shetty", email: "udaybhai@gmail.com", userName: "uday", password: "uday123", mobileNumber: "6479370707", dob: <#String?#>)
    let c2 =  Customer(customerId: "002", name: "Sagar Pandey", email: "majnu@gmail.com", userName: "Majju", password: "majnu123", mobileNumber: "1234567890", dob: <#String?#>)
    let c3 =  Customer(customerId: "003", name: "Guru Gulab Khatri", email: "ggk@gmail.com", userName: "ggk",password: "ggk123", mobileNumber: "7767676767", dob: <#String?#>)
       addCustomer(customer: c1)
       addCustomer(customer: c2)
       addCustomer(customer: c3)
}
    
func dictionaryToArray() -> [Customer]
    {
        var customerListStorage: [Customer] = []
        for i in customerDictionary{
        customerListStorage.append(i.value)
     }
        return customerListStorage
    }
}



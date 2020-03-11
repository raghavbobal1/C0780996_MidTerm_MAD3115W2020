
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
    
private init(){}

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
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    
    //Mobile Class Objects
    var m1 = Mobile(billId: 001, billDate: Date(), billType: BillType.Mobile, mobileManufacturerName: "Fido", planName: "Student Plan", mobileNumber: "6479370707", mobileDataUsed: 6.1, callMinutesUsed: 567.0)
    var m2 = Mobile(billId: 002, billDate: Date(), billType: BillType.Mobile, mobileManufacturerName: "Freedom", planName: "Business Plan", mobileNumber: "6478989998", mobileDataUsed: 8.9, callMinutesUsed: 999.67)
    var m3 = Mobile(billId: 003, billDate: Date(), billType: BillType.Mobile, mobileManufacturerName: "Bell", planName: "Home plan", mobileNumber: "6545656565", mobileDataUsed: 5.6, callMinutesUsed: 777.77)

    //Internet Class Objects
    var it1 = Internet(billId: 004, billDate: Date(), billType: BillType.Internet, providerName: "Rogers", internetGbUsed: 80.99)
    var it2 = Internet(billId: 005, billDate: Date(), billType: BillType.Internet, providerName: "Virgin", internetGbUsed: 57.87)
    var it3 = Internet(billId: 006, billDate: Date(), billType: BillType.Internet, providerName: "Bell", internetGbUsed: 88.05)

    //Hydro Class Objects
    var hy1 = Hydro(billId: 007, billDate: Date(), billType: BillType.Hydro, agencyName: "Toronto Hydro", unitsConsumed: 677)
    var hy2 = Hydro(billId: 008, billDate: Date(), billType: BillType.Hydro, agencyName:
        "Hydro One", unitsConsumed: 1227)
    var hy3 = Hydro(billId: 009, billDate: Date(), billType: BillType.Hydro, agencyName: "Ontario Hydro", unitsConsumed: 897)

    //Customer Class Obects
    let c1 =  Customer(customerId: "001", name: "Uday Shetty", email: "udaybhai@gmail.com", userName: "uday", password: "uday123", mobileNumber: "6479370707", dob: "20/12/2012")
    let c2 =  Customer(customerId: "002", name: "Sagar Pandey", email: "majnu@gmail.com", userName: "Majju", password: "majnu123", mobileNumber: "1234567890", dob: "20/12/2012")
    let c3 =  Customer(customerId: "003", name: "Guru Gulab Khatri", email: "ggk@gmail.com", userName: "ggk",password: "ggk123", mobileNumber: "7767676767", dob: "20/12/1202")
    let m1 =  Mobile(billId: 001, billDate: formatter.date(from: "2019/10/12")!, billType: BillType.Mobile, mobileManufacturerName: "FIDO", planName: "Student Plan", mobileNumber: "4379077578", mobileDataUsed: 1, callMinutesUsed: 6)
    }
    
       addCustomer(customer: c1)
       addCustomer(customer: c2)
       addCustomer(customer: c3)
    
func dictionaryToArray() -> [Customer]
    {
        var customerListStorage: [Customer] = []
        for i in customerDictionary
        {
        customerListStorage.append(i.value)
        }
        return customerListStorage
    }
}
 

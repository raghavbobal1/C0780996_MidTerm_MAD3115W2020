//
//  Mobile.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-10.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
public class Mobile: Bill
{
    private var mobileManufacturerName: String
    private var planName: String
    private var mobileNumber: String
    private var mobileDataUsed: Double
    private var callMinutesUsed: Double
    var type: BillType = BillType.Mobile

    
     init(billId: Int, billDate: Date, billType: BillType,mobileManufacturerName: String, planName: String, mobileNumber: String, mobileDataUsed: Double, callMinutesUsed: Double)
    {
           self.mobileManufacturerName = mobileManufacturerName
           self.planName = planName
           self.mobileNumber = mobileNumber
           self.mobileDataUsed = mobileDataUsed
           self.callMinutesUsed = callMinutesUsed
            super.init(billId: billId, billDate: billDate, billType: billType)
    }

    override func billCalculation() -> Double
    {
        var monthlyBill: Double = 0.0
        var minutePrice: Double = 0.0
        var dataPrice: Double = 0.0
        
         if (callMinutesUsed < 300)
           {
                minutePrice += 35
           }
         else if (callMinutesUsed > 300 && callMinutesUsed < 500 )
           {
                minutePrice += 50
           }
         else
           {
            minutePrice = 0.15 * callMinutesUsed
           }
        
         if (mobileDataUsed < 5)
           {
                dataPrice += 50
           }
         else if (mobileDataUsed > 5 && mobileDataUsed < 10)
           {
                dataPrice += 85
           }
         else
           {
                dataPrice = 9.75 * mobileDataUsed
           }
        
        monthlyBill = minutePrice + dataPrice
        return monthlyBill
        
    }
}
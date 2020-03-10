//
//  Hydro.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-10.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
public class Hydro: Bill
{
    private var agencyName: String
    private var unitsConsumed: Double
    var type: BillType = BillType.Hydro

    init(billId: Int, billDate: Date, billType: BillType,agencyName: String, unitsConsumed: Double)
      {
           self.agencyName = agencyName
           self.unitsConsumed = unitsConsumed
        super.init(billId: billId, billDate: billDate, billType: billType)
        
      }
    
    override func billCalculation() -> Double
    {
        var price:Double=0.0
        var hydroAmt:Double=0.0
        
        if (unitsConsumed < 600)
        {
            price += 150
        }
        else if (unitsConsumed > 600 && unitsConsumed <= 800)
        {
            price += 215
        }
        else if (unitsConsumed > 800 && unitsConsumed < 1000)
        {
            price += 300
        }
        else
        {
            price = 0.50 * unitsConsumed
        }
         
        hydroAmt = price
        return hydroAmt
    }
}
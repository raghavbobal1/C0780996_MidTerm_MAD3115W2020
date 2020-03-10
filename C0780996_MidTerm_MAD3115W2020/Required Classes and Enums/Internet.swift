//
//  Internet.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-10.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
public class Internet: Bill
{
    private var providerName: String
    private var internetGbUsed: Double
    var type: BillType = BillType.Internet

    init(billId: Int, billDate: Date, billType: BillType, providerName: String, internetGbUsed: Double)
    {
           self.providerName = providerName
           self.internetGbUsed = internetGbUsed
           super.init(billId: billId, billDate: billDate, billType: billType)
    }
    
   
    override func billCalculation() -> Double
    {
        var price: Double = 0.0
          
        if (internetGbUsed < 3)
        {
            price = 12.15 * internetGbUsed
        }
        else if (internetGbUsed > 3 && internetGbUsed < 10)
        {
            price = 14 * internetGbUsed
        }
        else
        {
            price = 15.15 * internetGbUsed
        }
              return price
    }
}

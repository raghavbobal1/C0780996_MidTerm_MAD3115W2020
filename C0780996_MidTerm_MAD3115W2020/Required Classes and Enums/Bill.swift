//
//  Bill.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-10.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
public class Bill
{
    private var billId: Int
    private var billDate: Date
    var totalBillAmount: Double = 0.0
    private var billType: BillType
    
    init(billId: Int, billDate: Date, billType: BillType)
    {
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
        self.totalBillAmount = billCalculation()
    }
    
    func billCalculation() -> Double
    {
        return 0.0
    }
}

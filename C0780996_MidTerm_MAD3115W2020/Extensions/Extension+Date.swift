//
//  Extension+Date.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-10.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

extension Date
{

public func getFormattedDate() -> String
 {
     let dateFormatterPrint = DateFormatter()
     dateFormatterPrint.dateFormat = "EEEE, MMMM dd, yyyy"
     let formattedDate = dateFormatterPrint.string(from: self)
     return formattedDate
 }
}

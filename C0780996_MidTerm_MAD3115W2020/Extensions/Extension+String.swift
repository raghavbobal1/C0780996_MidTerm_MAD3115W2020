//
//  Extension+String.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-13.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

extension String
{
  func toDate(withFormat format: String = "dd/MM/yyyy") -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    guard let date = dateFormatter.date(from: self) else {
      preconditionFailure("Take a look to your format")
    }
    return date
  }
}

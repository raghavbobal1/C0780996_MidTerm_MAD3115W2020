//
//  Extension+Currency.swift
//  C0780996_MidTerm_MAD3115W2020
//
//  Created by Raghav Bobal on 2020-03-10.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
extension Double
{
func Setcurrency() -> String
  {
    let s = String.init(format: "$%.2f", self)
    return s
  }
    
func gbUnit() -> String
  {
    return "\(self) GB"
  }

func units() -> String
  {
  return "\(self) Units"
  }
   

 func setMins() -> String
  {
    return "\(self) Mins"
   }
        
}

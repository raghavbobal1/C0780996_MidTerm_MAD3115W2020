
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


import Foundation

extension Date
{

public func getFormattedDate() -> String
 {
     let dateFormatterPrint = DateFormatter()
     dateFormatterPrint.dateFormat = "dd/MM/yyyy"
     let formattedDate = dateFormatterPrint.string(from: self)
     return formattedDate
 }
}


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

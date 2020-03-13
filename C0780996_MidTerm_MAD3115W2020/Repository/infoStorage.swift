
import Foundation
import UIKit

//A singleton class to store all the customers details

class DataRepository
{
   
static private var repoObj = DataRepository()
lazy var customerDictionary = Dictionary<String, Customer>()
    
private init(){}

static func getInstance() -> DataRepository
{
return repoObj
}
    
    // function to add customers
    
func addCustomer(customer: Customer)
  {
    let cid = customer.customerId
    customerDictionary.updateValue(customer, forKey: cid)
  }

    
    // function to load data
    
func loadData()
{
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    
    //Mobile Class Objects
    var m1 = Mobile(billId: "mob1", billDate: formatter.date(from: "13/12/2019")!, billType: BillType.Mobile, mobileManufacturerName: "Fido", planName: "Student Plan", mobileNumber: "6479370707", mobileDataUsed: 6.1, callMinutesUsed: Int(567.0))
    var m2 = Mobile(billId: "mob2", billDate:formatter.date(from: "07/07/2019")!, billType: BillType.Mobile, mobileManufacturerName: "Freedom", planName: "Business Plan", mobileNumber: "6478989998", mobileDataUsed: 8.9, callMinutesUsed: Int(999.67))
    var m3 = Mobile(billId: "mob3", billDate:formatter.date(from: "14/10/2019")!, billType: BillType.Mobile, mobileManufacturerName: "Bell", planName: "Home plan", mobileNumber: "6545656565", mobileDataUsed: 5.6, callMinutesUsed: Int(777.77))
    //Internet Class Objects
    var in1 = Internet(billId: "in1", billDate: formatter.date(from: "21/07/2019")!, billType: BillType.Internet, providerName: "Rogers", internetGbUsed: 80.99)
    var in2 = Internet(billId: "in2", billDate: formatter.date(from: "20/02/2019")!, billType: BillType.Internet, providerName: "Virgin", internetGbUsed: 57.87)
    var in3 = Internet(billId: "in3", billDate: formatter.date(from: "12/07/2019")!, billType: BillType.Internet, providerName: "Bell", internetGbUsed: 88.05)

    //Hydro Class Objects
    var hy1 = Hydro(billId: "hy1", billDate: formatter.date(from: "13/07/2019")!, billType: BillType.Hydro, agencyName: "Toronto Hydro", unitsConsumed: 677)
    var hy2 = Hydro(billId: "hy2", billDate: formatter.date(from: "10/07/2019")!, billType: BillType.Hydro, agencyName:
        "Hydro One", unitsConsumed: 1227)
    var hy3 = Hydro(billId: "hy3", billDate: formatter.date(from: "27/10/2019")!, billType: BillType.Hydro, agencyName: "Ontario Hydro", unitsConsumed: 897)

    //Customer Class Obects
    let c1 =  Customer(customerId: "001", name: "Uday Shetty", email: "udaybhai@gmail.com", userName: "uday", password: "uday123", mobileNumber: "6479370707", dob: "20/12/1987")
    let c2 =  Customer(customerId: "002", name: "Sagar Pandey", email: "majnu@gmail.com", userName: "Majju", password: "majnu123", mobileNumber: "4166144664", dob: "20/12/1967")
    let c3 =  Customer(customerId: "003", name: "Guru Gulab Khatri", email: "guru@gmail.com", userName: "ggk",password: "ggk123", mobileNumber: "6478579909", dob: "20/12/1997")
     
        // adding bills for customera
        c1.newBill(bill: m1, billId: "mob1")
        c1.newBill(bill: hy3, billId: "hy3")
        c1.newBill(bill: in1, billId: "in1")
        c2.newBill(bill: hy1, billId: "hy1")
        c2.newBill(bill: m2, billId: "mob2")
        c2.newBill(bill: hy2, billId: "hy2")
        c2.newBill(bill: in3, billId: "in3")
        c2.newBill(bill: m1, billId: "mob1")
        c3.newBill(bill: hy2, billId: "hy1")
        c3.newBill(bill: m2, billId: "mob2")
        c3.newBill(bill: in1, billId: "in1")
        c3.newBill(bill: m1, billId: "mob1")
        
        //adding customers
        addCustomer(customer: c1)
        addCustomer(customer: c2)
        addCustomer(customer: c3)
    }
    
    //functon for dictionary to array
    
func dictionaryToArray() -> [Customer]
    {
        var customerListStorage: [Customer] = []
        for i in customerDictionary
        {
        customerListStorage.append(i.value)
        }
        return customerListStorage
    }
}
 

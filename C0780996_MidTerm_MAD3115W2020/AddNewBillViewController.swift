
import UIKit

class AddNewBillViewController: UIViewController
{
    @IBOutlet weak var txtBillId: UITextField!
    @IBOutlet weak var txtBillDate: UITextField!
    @IBOutlet weak var txtBillType: UITextField!
    @IBOutlet weak var segmentBilltype: UISegmentedControl!
    @IBOutlet weak var txtHydUnits: UITextField!
    @IBOutlet weak var txtHydAgency: UITextField!
    @IBOutlet weak var txtIntData: UITextField!
    @IBOutlet weak var txtIntProvider: UITextField!
    @IBOutlet weak var txtMobMins: UITextField!
    @IBOutlet weak var txtMobData: UITextField!
    @IBOutlet weak var txtMobNumber: UITextField!
    @IBOutlet weak var txtMobPlan: UITextField!
    @IBOutlet weak var txtMobManufacturer: UITextField!
    var selectedCustomer: Customer?
    var currentSlected: Int = 0
    var datePicker : UIDatePicker!
    var myPickerView : UIPickerView!
    var pickerDataBillType = ["Mobile" , "Internet" , "Hydro"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.txtBillDate.setInputViewDatePicker(target: self, selector: #selector(tapDone))
        self.initialSetting()
    
    }
    @objc func tapDone() {
        if let datePicker = self.txtBillDate.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            self.txtBillDate.text = dateformatter.string(from: datePicker.date)
        }
        self.txtBillDate.resignFirstResponder()
    }
    
    
    @IBAction func btnAddBill(_ sender: Any) {
        if (segmentBilltype.selectedSegmentIndex == 0){
            if(Validations.mobileNumber(number: txtMobNumber.text!) == true){
                if((txtBillId.text?.contains("MB"))!)
                {
                    let billObj = Mobile(billId: txtBillId.text!, billDate:  (txtBillDate.text?.toDate())!, billType: BillType.Mobile
                    ,mobileManufacturerName: txtMobManufacturer.text!, planName: txtMobPlan!.text!, mobileNumber: txtMobNumber!.text!, mobileDataUsed: Double(txtMobData!.text!)!, callMinutesUsed: Int(txtMobMins!.text!)!)
                selectedCustomer?.newBill(bill: billObj, billId: txtBillId.text!)
                    billSuccess()
                }
                else{
                    let alertController = UIAlertController(title:"Error", message: "Bill ID must contain MB", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
            }
            let alertController = UIAlertController(title:"Error", message: "Invalid phone number", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        if(segmentBilltype.selectedSegmentIndex == 1){
            if((txtBillId.text?.contains("HY"))!){
                let billObj = Hydro(billId: txtBillId.text!, billDate:  (txtBillDate.text?.toDate())!, billType: BillType.Hydro, agencyName: txtHydAgency!.text!, unitsConsumed: Double(txtHydUnits!.text!)!)
            selectedCustomer?.newBill(bill: billObj, billId: txtBillId.text!)
            billSuccess()
            }
            else {
                let alertController = UIAlertController(title:"Error", message: "Bill ID must contain HY", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
                return
            }
        }
        if(segmentBilltype.selectedSegmentIndex == 2){
            if((txtBillId.text?.contains("IN"))!){
                let billObj = Internet(billId: txtBillId.text!, billDate:  (txtBillDate.text?.toDate())!, billType: BillType.Internet, providerName: txtIntProvider!.text!, internetGbUsed: Double(txtIntData!.text!) as! Double)
            selectedCustomer?.newBill(bill: billObj, billId: txtBillId.text!)
            billSuccess()
            }
            else {
                let alertController = UIAlertController(title:"Error", message: "Bill ID must contain IN", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
                return
            }
        }
    }
    func billSuccess(){
        let alertController = UIAlertController(title: "Success", message: "Bill Added", preferredStyle: .alert)
        //alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.forceReloadBillTable()}))
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.dismissView()}))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func forceReloadBillTable(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let showBillDetailsVC = sb.instantiateViewController(identifier: "showBillDetailsVC") as! ShowBillDetailsViewController
        navigationController?.pushViewController(showBillDetailsVC, animated: true)
    }
    
    func dismissView()
    {

        navigationController?.popViewController(animated: true)
    }
    
    func firstSetting(){
    self.txtMobMins.isHidden = true
    self.txtMobData.isHidden = true
    self.txtMobManufacturer.isHidden = true
    self.txtMobPlan.isHidden = true
    self.txtMobNumber.isHidden = true
    self.txtMobManufacturer.isHidden = true
    }
    func initialSetting(){
        self.txtHydUnits.isHidden = true;
        self.txtHydAgency.isHidden = true;
        self.txtIntData.isHidden = true
        self.txtIntProvider.isHidden = true
        self.txtMobMins.isHidden = false
        self.txtMobData.isHidden = false
        self.txtMobManufacturer.isHidden = false
        self.txtMobPlan.isHidden = false
        self.txtMobNumber.isHidden = false
        self.txtMobManufacturer.isHidden = false
    }
    
    
    @IBAction func segBill(_ sender: Any) {
        if (segmentBilltype.selectedSegmentIndex == 0) {
            self.txtHydUnits.isHidden = true;
            self.txtHydAgency.isHidden = true;
            initialSetting()
        }
        if(segmentBilltype.selectedSegmentIndex == 1) {
            firstSetting()
            self.txtHydAgency.isHidden = false
            self.txtHydUnits.isHidden = false
            self.txtIntData.isHidden = true
            self.txtIntProvider.isHidden = true
        }
        if(segmentBilltype.selectedSegmentIndex == 2){
            firstSetting()
            self.txtHydAgency.isHidden = true
            self.txtHydUnits.isHidden = true
            self.txtIntData.isHidden = false
            self.txtIntProvider.isHidden = false

        }
    }
    
}

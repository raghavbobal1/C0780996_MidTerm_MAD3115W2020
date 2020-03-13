
import UIKit

class AddNewCustomerViewController: UIViewController
{

    @IBOutlet weak var lblCustomerInformation: UILabel!
    @IBOutlet weak var txtNewCustomerId: UITextField!
    @IBOutlet weak var txtNewCustomerEmail: UITextField!
    @IBOutlet weak var txtNewCustomerName: UITextField!
    @IBOutlet weak var txtNewCustomerNumber: UITextField!
    @IBOutlet weak var txtNewCustomerPassword: UITextField!
    @IBOutlet weak var txtNewCustomerUserName: UITextField!
    @IBOutlet weak var txtNewCustomerDOB: UITextField!
    
    @IBOutlet weak var dtPickerDOB: UIDatePicker!
    
    @IBAction func btnAddNewCustomer(_ sender: Any) {
        let txtNumber = txtNewCustomerNumber.text!
        let txtmail  = txtNewCustomerEmail.text!
        
        if(txtNewCustomerId.text == "" || txtNewCustomerUserName.text == "" || txtNewCustomerPassword.text == "")
        {
            let alertController = UIAlertController(title:"Error", message: "Invalid entry, fields left blank", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        if(Validations.email(email: txtmail) == false && Validations.mobileNumber(number: txtNumber) == false)
        {
            let alertController = UIAlertController(title:"Error", message: "Invalid email ID and phone number", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        if(Validations.email(email: txtmail) == false)
            {
                let alertController = UIAlertController(title:"Error", message: "Invalid email ID", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
                return
            }
        
        if(Validations.mobileNumber(number: txtNumber) == false)
        {
            let alertController = UIAlertController(title:"Error", message: "Invalid phone number", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        let c = Customer(customerId: txtNewCustomerId.text!, name: txtNewCustomerName.text!, email: txtNewCustomerEmail.text!, userName: txtNewCustomerUserName.text!, password: txtNewCustomerPassword.text!, mobileNumber: txtNewCustomerNumber.text!, dob: txtNewCustomerDOB.text)
        
            DataRepository.getInstance().addCustomer(customer: c)
        
        
        let alertController = UIAlertController(title: "Success", message: "Customer Added", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler:
            {   action in self.dismissView()}))
                self.present(alertController, animated: true, completion: nil)
            }
        func dismissView()
        {
            navigationController?.popViewController(animated: true)
        }
    
        override func viewDidLoad()
        {
            super.viewDidLoad()
            self.txtNewCustomerDOB.setInputViewDatePicker(target: self, selector: #selector(tapDone))
        }
      
      @objc func tapDone()
      {
        if let datePicker = self.txtNewCustomerDOB.inputView as? UIDatePicker
        {
              let dateformatter = DateFormatter()
              dateformatter.dateStyle = .medium
              self.txtNewCustomerDOB.text = dateformatter.string(from: datePicker.date)
          }
          self.txtNewCustomerDOB.resignFirstResponder()
      }
}




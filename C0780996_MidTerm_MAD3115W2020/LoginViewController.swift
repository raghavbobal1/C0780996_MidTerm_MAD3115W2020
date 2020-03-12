

import UIKit


class LoginViewController: UIViewController
{
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    @IBOutlet weak var switchRememberMe: UISwitch!

    var loggedIn = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getRememberMeValues()
        txtName.text = ""
        txtUserPassword.text = ""
        let userDefault = UserDefaults.standard
        let name = userDefault.string(forKey:"name")
        let password = userDefault.string(forKey: "password")
        self.navigationItem.hidesBackButton = true
        if let nm = name
            {
                txtName.text = nm
            }
        if let pw = password
            {
                txtUserPassword.text = pw
            }
    }
                        
    @IBAction func btnLogin(_ sender: Any)
    {
        let userName = self.txtName.text!
        let password = self.txtUserPassword.text!
        let userDefault = UserDefaults.standard
        if (userName == "" || password == "")
        {
            let alertController = UIAlertController(title: "Error", message: "Username/Password cannot be left blank", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
         
        
        if let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        {
         if let dict = NSDictionary(contentsOfFile: plist)
         {
          if let users = dict["Users"] as? [[String:Any]]
          {
            for user in users
             {
               if ((userName==(user["userName"] as! String))&&(password==(user["password"] as! String)))
                    {
                     if self.switchRememberMe.isOn
                      {
                        userDefault.setValue(self.txtName.text, forKey: "userEmail")
                        userDefault.set(self.txtUserPassword.text, forKey: "userPassword")
                      }
                      else
                      {
                        userDefault.removeObject(forKey: "userName")
                        userDefault.removeObject(forKey: "userPassword")
                       }
                        self.performSegue(withIdentifier: "userProfile", sender: nil)
                        loggedIn = true
                      }
                    }
                }
            }
        }
        if !loggedIn
        {
            
                let alert = UIAlertController(title: "Error", message: "User Email / Password Incorrect", preferredStyle: UIAlertController.Style.alert)
                
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                let actionCanel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(actionOk)
                alert.addAction(actionCanel)
                self .present(alert, animated: true ,completion: nil)
            
        }
        

    }

    private func getRememberMeValues()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userName")
        {
            txtName.text = email
            
            if let pwd = userDefault.string(forKey: "userPassword")
            {
                txtUserPassword.text = pwd
            }
        }
    }
    
    @IBAction func unWindLogoutFromAnyScreen(storyboard : UIStoryboardSegue)
    {
        print("Logout")
        let s = storyboard.source as! CustomerListTableViewController
        txtName.text=""
        txtUserPassword.text=""
    }


}




import UIKit


class LoginViewController: UIViewController
{
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var swchRememberMe: UISwitch!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        txtName.text = ""
        txtPassword.text = ""
        let ud = UserDefaults.standard
        let name = ud.string(forKey:"name")
        let password = ud.string(forKey: "password")
        self.navigationItem.hidesBackButton = true
        if let nm = name
            {
                txtName.text = nm
            }
        if let pw  = password
            {
                txtPassword.text = pw
            }
    }
                        
    @IBAction func btnLogin(_ sender: Any)
    {
        let userName = self.txtName.text!
        let password = self.txtPassword.text!
        if (userName == "" || password == "")
        {
            let alertController = UIAlertController(title: "Error", message: "Username/Password cannot be left blank", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    
        if let plist = Bundle.main.path(forResource: "CustomerInfo", ofType: "plist")
        {
            if let dict = NSDictionary(contentsOfFile: plist)
            {
             if let customers = dict["Customers"] as? [[String:Any]]
             {
              for customer in customers
              {
                if ((userName == (customer["customerUserName"] as! String)) && (password == (customer["customerPassword"] as! String)))
                {
                 let sb = UIStoryboard(name: "Main", bundle: nil)
                 let CustomerListTableVC = sb.instantiateViewController(identifier: "customerListTableVC") as!CustomerListTableViewController
                  navigationController?.pushViewController(CustomerListTableVC, animated: true)
                        
                      if swchRememberMe.isOn
                      {
                        let defaults = UserDefaults.standard
                        _ = defaults.set(txtName.text, forKey: "name")
                        _ = defaults.set(txtPassword.text, forKey: "password")
                      }
                                              
                    else
                    {
                      UserDefaults.standard.removeObject(forKey: "name")
                      UserDefaults.standard.removeObject(forKey: "password")
                    }
                      return
                    }
    
                  }
                    let alertController = UIAlertController(title: "Error", message: "Incorrect username/password", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                      
                }
               }
        }
    }
 }



//  ViewController.swift
//  C0751145_MidTerm_MAD3115S2019
//
//  Created by Ankita Pabbi on 2019-07-11.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loggedIn = false

    @IBOutlet weak var txtUserEmail: UITextField!
    
    @IBOutlet weak var txtUserPassword: UITextField!
  
    @IBOutlet weak var switchRememberMe: UISwitch!
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        var email = self.txtUserEmail.text!
        var password = self.txtUserPassword.text!
         let userDefault = UserDefaults.standard
        
        if let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        {
            if let dict = NSDictionary(contentsOfFile: plist)
            {
                if let users = dict["Users"] as? [[String:Any]]
                {
                    for user in users
                    {
                        if ( (email == (user["userEmail"] as! String)) && (password == (user["password"] as! String)) ){
                            
                          
                            if self.switchRememberMe.isOn
                            {
                                userDefault.setValue(self.txtUserEmail.text, forKey: "userEmail")
                                userDefault.set(self.txtUserPassword.text, forKey: "userPassword")
                               
                                
                                
                            }
                            else
                            {
                                userDefault.removeObject(forKey: "userEmail")
                                userDefault.removeObject(forKey: "userPassword")
                                
                            }
                            self.performSegue(withIdentifier: "userProfile", sender: nil)
                            loggedIn = true
                            
                           
                           
                        }
                    }
                }
            }
        }
        if !loggedIn{
            
                let alert = UIAlertController(title: "Error", message: "User Email / Password Incorrect", preferredStyle: UIAlertController.Style.alert)
                
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                let actionCanel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(actionOk)
                alert.addAction(actionCanel)
                self .present(alert, animated: true ,completion: nil)
            
        }
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
             getRememberMeValues()
       
    }
    private func getRememberMeValues()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userEmail")
        {
            txtUserEmail.text = email
            
            if let pwd = userDefault.string(forKey: "userPassword")
            {
                txtUserPassword.text = pwd
            }
        }
    }
    
    @IBAction func unWindLogoutFromAnyScreen(storyboard : UIStoryboardSegue){
        print("Logout")
        // picking value from sencond screen and displaying on first screen while logout
        let s = storyboard.source as! BillListTableViewController
        txtUserEmail.text = ""
        txtUserPassword.text = ""
        
    }


}


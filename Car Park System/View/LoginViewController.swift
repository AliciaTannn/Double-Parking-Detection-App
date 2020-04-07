//
//  LoginViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 30/01/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var email:String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide error label
        errorLabel.alpha = 0
    }
    
    //Go to register page
    @IBAction func btnRegister(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToRegisterPage", sender: self)
    }
    
    //Login into account
    @IBAction func btnLogin(_ sender: Any) {
            
            //Show progress activity indicator
            SVProgressHUD.show()
            //Change style of the activity indicator to dark theme
            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
            
            //Remove white spaces and new lines for email & password
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                //If there is an error, display error message which is "Invalid login. Please try again." Reset the textfields and dismiss the activity indicator.
                if error != nil {
                    // Couldn't sign in
                    self.errorLabel.text = "Invalid Login. Please try again."
                    self.errorLabel.alpha = 1
                    self.txtEmail.text = ""
                    self.txtPassword.text = ""
                    print("Invalid Login")
                    SVProgressHUD.dismiss()
                }
                else {
                //When user authenticated, dismiss activity indicator and direct user to homepage.
                print("User Authenticated")
                SVProgressHUD.dismiss()
                SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)                
                self.performSegue(withIdentifier: "goToHomePage", sender: self)
                }
            }
        }
    }

//UITextFieldDelegate

//Inheritance
extension LoginViewController: UITextFieldDelegate {
    //call keyboard when 'return' key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
        return true
    }
}


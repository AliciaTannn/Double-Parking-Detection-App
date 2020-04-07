//
//  RegisterViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 01/02/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide the error label
        lblError.alpha = 0
    }
    
    //Check the fields and validate that the data is correct. If everything is correct, this method returns nil.
    //Otherwise, it returns the error message.
   func validateFields() -> String? {
        
        // Check that all fields are filled in
        if txtName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
            // Check if the password is secure
           let cleanedPassword = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           let cleanedEmail = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           
           if Utilities.isPasswordValid(cleanedPassword) == false {
               // Password isn't secure enough
               return "Please make sure your password is at least 8 characters, contains a special character and a number."
           }
    
            if Utilities.isValidEmail(cleanedEmail) == false {
                // Email is not valid
                return "Please enter a valid email."
            }
           
           return nil
    }
    
    //Login Button
    @IBAction func btnLogin(_ sender: UIButton) {
        //Go to login page
        self.performSegue(withIdentifier: "goToLoginPage", sender: self)
    }
    
    //Register Button
    @IBAction func btnRegister(_ sender: UIButton) {
        //Show activity indicator
        SVProgressHUD.show()
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        
        // Validate the fields
        let error = validateFields()
        if error != nil {
            // There's something wrong with the fields, show error message
            showError(error!)
            SVProgressHUD.dismiss()
            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        }
        else {
            // Remove white space and new line (Clean the data)
            let name = txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
             Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                       guard let user = authResult?.user, error == nil else {
                               print(error ?? "Invalid email or password")
                               return
                       }
                      //Write to the Users table in Firebase
                       var ref: DatabaseReference!
                       ref = Database.database().reference(fromURL: "https://smart-parking-666.firebaseio.com/")
                       let usersReference = ref.child("users").child(user.uid)
                       let values = ["name": name, "email": email]
                       usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                           if err != nil {
                               print(err ?? "error adding to database")
                               return
                           }
                           self.dismiss(animated: true, completion: nil)
                       })
                   }
                    // Transition to the home screen
                    SVProgressHUD.dismiss()
                    SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
                    self.performSegue(withIdentifier: "goToGetNotify", sender: self)
                }
            }
        
    //Show label for error message & clear the text fields
    func showError(_ message:String) {
        lblError.text = message
        lblError.alpha = 1
        txtName.text = ""
        txtEmail.text = ""
        txtPassword.text = ""
        txtConfirmPassword.text = ""
    }
}

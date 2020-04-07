//
//  Utilities.swift
//  Car Park System
//
//  Created by Alicia Tan on 12/03/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import Foundation
import UIKit

//Class to validate the password and email fields for Register & login viewcontroller
class Utilities {
    
    //To check if the password format is valid. The password must have 8 characters long. It must contain alphabets, number and special characters.
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    //To check if the email format is valid. The email must contain @.
    static func isValidEmail(_ email : String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: email)
    }
    
}

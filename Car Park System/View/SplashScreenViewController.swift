//
//  SplashScreenViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 31/01/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnRegister(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToRegisterPage", sender: self)
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToLoginPage", sender: self)
    }
}

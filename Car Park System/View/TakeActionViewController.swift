//
//  TakeActionViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 29/01/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit

class TakeActionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToHomePage", sender: self)
    }
    
}

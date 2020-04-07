//
//  ViewHistoryViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 29/01/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit

class ViewHistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func btnNext(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToAction", sender: self)
    }
}

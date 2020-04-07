//
//  AlertViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 21/03/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

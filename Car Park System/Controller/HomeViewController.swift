//
//  ViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 28/01/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit
import NotificationBannerSwift
import UserNotifications
import FirebaseDatabase
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //let banner = NotificationBanner(title: "Request", subtitle: "There is a double parked car", style: .success)
        //banner.show()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //Go to request page
    @IBAction func btnRequest(_ sender: UIButton) {
         self.performSegue(withIdentifier: "goToRequest", sender: self)
     }
    
    //Go to report page
     @IBAction func btnReport(_ sender: UIButton) {
         self.performSegue(withIdentifier: "goToReport", sender: self)
     }
     
    //Go to history page
     @IBAction func btnHistory(_ sender: UIButton) {
         self.performSegue(withIdentifier: "goToHistory", sender: self)
     }
    
    //Go to settings page
     @IBAction func btnSettings(_ sender: UIButton) {
         self.performSegue(withIdentifier: "goToSetting", sender: self)
     }
}


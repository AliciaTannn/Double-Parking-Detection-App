//
//  DescriptionViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 02/02/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var lblRequest: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblRemark: UILabel!
    let alertService = AlertService()
    var selectedCarId:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Get data based on selectedCarId
        NSLog("Id is: "+selectedCarId, self)
        self.lblRequest.text = selectedCarId
        
        var ref: DatabaseReference?
        //Set the firebase reference
        ref = Database.database().reference().child("request")
        //Get query by requestName that is equalled to the query clicked by the user in the Request table view
        let query = ref?.queryOrdered(byChild: "requestName").queryEqual(toValue: selectedCarId)
        
        //observing the data changes
        query?.observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children {
                //Get the time, location, status and remark data from Firebase
                let childSnap = child as! DataSnapshot
                let dict = childSnap.value as! [String: Any]
                let time = dict["time"] as! String
                let location = dict["location"] as! String
                let status = dict["status"] as! String
                let remark = dict["remark"] as! String
                self.lblTime.text = time
                self.lblLocation.text = location
                self.lblStatus.text = status
                self.lblRemark.text = remark
                NSLog(childSnap.key, time)
            }
        })
    }
    
    @IBAction func btnClamp(_ sender: Any) {
        //When clamp button is clicked, show the alert view to display successful or fail message
         let alertVC = alertService.alert()
        present(alertVC, animated: true)
        //Go to the home page
        self.performSegue(withIdentifier: "goToHomePage", sender: self)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

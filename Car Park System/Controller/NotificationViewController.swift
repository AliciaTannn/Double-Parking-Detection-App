//
//  NotificationViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 03/03/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    
    //var notifications: [Notification] = []
    var notification: [Notification] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notification = createArray()
    }
    
    //Array to store notifications
    func createArray() -> [Notification] {
        
        //var tempNotification: [Notification] = []
        var tempNotifications: [Notification] = []
        
        let notify01 = Notification(image: #imageLiteral(resourceName: "carIcon"), title: "You have just received a request!")
        let notify02 = Notification(image: #imageLiteral(resourceName: "carIcon"), title: "You have just received a request!")
        let notify03 = Notification(image: #imageLiteral(resourceName: "carIcon"), title: "You have just received a request!")
        let notify04 = Notification(image: #imageLiteral(resourceName: "carIcon"), title: "You have just received a request!")
       
        tempNotifications.append(notify01)
        tempNotifications.append(notify02)
        tempNotifications.append(notify03)
        tempNotifications.append(notify04)
        
        return tempNotifications
    }
}

extension NotificationViewController: UITableViewDataSource, UITableViewDelegate {
    
    //Return the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notification.count
    }
    
    //Define cell to insert in a particular location of the table view.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notifications = notification[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell
        
        cell.setNotification(notification: notifications)
        
        return cell
    }
    
    //Go to request page when table view cell is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           performSegue(withIdentifier: "requestVC", sender: self)
       }
    
    
}

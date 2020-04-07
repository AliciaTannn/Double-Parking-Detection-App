//
//  GetNotifyViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 29/01/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit
import UserNotifications

//Inheritance
class GetNotifyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //If user clicks Enable button, show the alert view to prompt user to enable push notification
    @IBAction func btnEnableNotification(_ sender: UIButton) {
        // Ask user permission
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Permission granted. Scheduling notification")
                self.scheduleNotification()
            }
        }
        //Go to HistoryViewController.swift
        self.performSegue(withIdentifier: "goToHistory", sender: self)
    }
    
    //Schedule push notification to appear
     func scheduleNotification() {
            let notificationCenter = UNUserNotificationCenter.current()
            
            let notification = UNMutableNotificationContent()
            notification.title = "Important Message"
            notification.body = "Request Detected!"
            notification.categoryIdentifier = "alarm"
            notification.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 8
            dateComponents.minute = 0
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notification, trigger: trigger)

            notificationCenter.add(notificationRequest)
        }
    }

//Extension
extension UIViewController: UNUserNotificationCenterDelegate {
    
    //Closure function to present the push notification
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void) {
        completionHandler( [.alert, .badge, .sound])
    }
}

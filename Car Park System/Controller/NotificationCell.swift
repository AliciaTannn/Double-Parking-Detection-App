//
//  NotificationCell.swift
//  Car Park System
//
//  Created by Alicia Tan on 03/03/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit

//Class for Notification Table Cell
class NotificationCell: UITableViewCell {


    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var notificationLbl: UILabel!
    
    //Initalize the image and label in the notification table cell.
    func setNotification(notification: Notification) {
        notificationImage.image = notification.image
        notificationLbl.text = notification.title
    }
    

}

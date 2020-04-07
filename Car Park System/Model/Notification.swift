//
//  Notification.swift
//  Car Park System
//
//  Created by Alicia Tan on 03/03/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import Foundation
import UIKit

class Notification {
    
    //Encapsulation concept - restrict access to certain data, variables or fields by declaring variables as private.
    private(set) var image: UIImage
    private(set) var title: String
    
    //Initialize the variables
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}

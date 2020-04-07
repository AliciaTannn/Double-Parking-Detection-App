//
//  AlertService.swift
//  Car Park System
//
//  Created by Alicia Tan on 21/03/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit

//To return the custom alert view to be displayed (AlertStoryboard.storyboard). This function is called in DescriptionViewController.swift.
class AlertService {
    
    func alert() -> AlertViewController {
        let storyboard = UIStoryboard(name: "AlertStoryboard", bundle: .main)
        let alertVC = storyboard.instantiateViewController(identifier: "AlertVC") as! AlertViewController
        
        return alertVC
    }
}

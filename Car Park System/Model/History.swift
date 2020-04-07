//
//  History.swift
//  Car Park System
//
//  Created by Alicia Tan on 21/03/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import Foundation
import UIKit

class History {
    
    //Encapsulation concept - restrict access to certain data, variables or fields by declaring variables as private.
    private(set) var title: String
    private(set) var date: String
    private(set) var status: String
    
    //Initialize variables
    init(title: String, date: String, status: String) {
        self.title = title
        self.date = date
        self.status = status
    }
    
}

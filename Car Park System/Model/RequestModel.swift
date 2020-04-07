//
//  RequestModel.swift
//  Car Park System
//
//  Created by Alicia Tan on 18/03/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import Foundation

//Declare the properties of Request
class RequestModel {
    
    //Encapsulation concept - restrict access to certain data, variables or fields by declaring variables as private.
    private(set) var id: String?
    private(set) var name: String?
    
    //Swift Initializer concept
    init(id: String?, name: String?) {
        self.id = id
        self.name = name
    }
    
    
}

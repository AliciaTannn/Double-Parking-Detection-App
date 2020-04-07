//
//  RequestTableViewCell.swift
//  Car Park System
//
//  Created by Alicia Tan on 18/03/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit

//For table view cell in HistoryViewController.swift
class RequestTableViewCell: UITableViewCell {

    //UI Elements
    @IBOutlet weak var lblRequest: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //Method overriding - to set the UI elements in the table view cell
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

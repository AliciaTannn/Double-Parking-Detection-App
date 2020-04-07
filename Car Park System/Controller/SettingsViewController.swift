//
//  SettingsViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 12/03/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit
import QuickTableViewController
import FirebaseAuth
import Firebase


class SettingsViewController: QuickTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

          tableContents = [
               Section(title: "Settings", rows: [
                 SwitchRow(text: "Enable push notifications", switchValue: true, action: { _ in })
               ]),

               Section(title: "Logout", rows: [
                 TapActionRow(text: "Logout", action: { [weak self] in self?.logout($0) })
               ]),

             ]
           }

           private func logout(_ sender: Row)
           {
            do{
                try Auth.auth().signOut()
                performSegue(withIdentifier: "goToLaunchScreen", sender: sender)
                print("User logged out")
            }
            catch
            {
                print(error)
            }
           }
           }



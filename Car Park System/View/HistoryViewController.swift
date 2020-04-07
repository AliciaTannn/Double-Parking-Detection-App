//
//  HistoryViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 02/02/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit
import Charts
import FirebaseDatabase

class HistoryViewController: UIViewController {
    
    var ref: DatabaseReference?
    var historyData = [History]()
    var carArray = [String]()
    var filteredCarArray = [String]()
    var searching = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.backgroundImage = UIImage()
        //Set the firebase reference
               ref = Database.database().reference().child("history")
               
               //observing the data changes
               ref?.observe(DataEventType.value, with: { (snapshot) in
                   
                   //if the reference have some values
                   if snapshot.childrenCount > 0 {
                    
                       //clearing the list
                       self.historyData.removeAll()
                       //iterating through all the values
                       for history in snapshot.children.allObjects as! [DataSnapshot] {
                           //getting values
                           let historyObject = history.value as? [String: AnyObject]
                           let historyTitle  = historyObject?["historyName"]
                           let historyDate = historyObject?["date"]
                           let historyStatus = historyObject?["status"]
                           
                           //creating artist object with model and fetched values
                        let history = History(title: historyTitle as! String, date: historyDate as! String, status: historyStatus as! String)
                           
                           //appending it to list
                           self.historyData.append(history)
                       }
                       
                       //reloading the tableview
                       self.tableView.reloadData()
                   }
               })
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    //To return the number of rows in table view by counting the number of data in the array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if searching {
                      return filteredCarArray.count
                  } else {
                      return historyData.count
                  }
       }
    
    //To return the cell to insert in a particular location of the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
     if searching {
         cell.lblTitle.text = filteredCarArray[indexPath.row]
     } else {
        let history: History
        history = historyData[indexPath.row]
        cell.lblTitle.text = history.title
        cell.lblDate.text = history.date
        
        if history.status == "Pending" {
            cell.imgStatus.image = UIImage(named: "Pending.png")
        }
        else if history.status == "Paid" {
            cell.imgStatus.image = UIImage(named: "Paid.png")
        }
         carArray.append(history.title)
     }
        return cell
    }
}

extension HistoryViewController: UISearchBarDelegate {
    //Filter the text in the search bar and reload the table view
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCarArray = carArray.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
}


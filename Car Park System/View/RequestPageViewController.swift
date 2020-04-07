//
//  RequestPageViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 30/01/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

//Import libraries
import UIKit
import NotificationBannerSwift
import FirebaseDatabase
import FirebaseAuth

class RequestPageViewController: UIViewController {
    
    //UI elements
    @IBOutlet weak var searchBar: UISearchBar!
    //@IBOutlet weak var lblCarPlate: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //Declare database reference
    var ref: DatabaseReference?
    var requestData = [RequestModel]()
    var selectedCarId:String = ""
    var carArray = [String]()
    var filteredCarArray = [String]()
    var searching = false
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        //To make search bar transparent
        searchBar.backgroundImage = UIImage()
        //Set the navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //Declare table view delegate and dataSource
        tableView.delegate = self
        tableView.dataSource = self
        
        //Read data from firebase
        //Set the firebase reference
        ref = Database.database().reference().child("request")
        
        //observing the data changes
        ref?.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.requestData.removeAll()
                
                //iterating through all the values
                for request in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let requestObject = request.value as? [String: AnyObject]
                    let requestName  = requestObject?["requestName"]
                    let id = requestObject?["id"]
                    
                    //creating artist object with model and fetched values
                    let request = RequestModel(id: id as! String?, name: requestName as! String?)
                    
                    //appending it to list
                    self.requestData.append(request)
                }
                
                //reloading the tableview
                self.tableView.reloadData()
            }
        })
    }
    
    //Method overloading
    //Prepare segue and pass data to next controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "carDetails" {
            let vc = segue.destination as! DescriptionViewController
            
            //Send data to next controller
            vc.selectedCarId = self.selectedCarId
        }
        
    }
}

extension RequestPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //If search, return number of filtered cars plates, if not, return number of normal car plates
        if searching {
            return filteredCarArray.count
        } else {
            return requestData.count
        }
    }
          
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RequestTableViewCell
        if searching {
            //If searching, fill the table view cells with searched results
            cell.lblRequest.text = filteredCarArray[indexPath.row]
        } else {
            //If not searching, fill the table view cells with normal results
            let request: RequestModel
            request = requestData[indexPath.row]
            cell.lblRequest.text = request.name
            carArray.append(request.name!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let vc = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as? DescriptionViewController
        
        //When user clicks a request, assign the value to selectedCarId
        if searching {
            selectedCarId = filteredCarArray[indexPath.item]
        } else {
            selectedCarId = carArray[indexPath.item]
        }
        NSLog("ID is:"+selectedCarId , self)
        //Pass value to the next view controller
        performSegue(withIdentifier: "carDetails", sender: self)
        //self.navigationController?.pushViewController(vc!, animated: true)
        //if let navigationObject = UIStoryboard(name: "Main.storyboard", bundle: nil).instantiateViewController(withIdentifier: //"DescriptionViewController") as? DescriptionViewController {

       // navigationController?.pushViewController(navigationObject, animated: true)
        //         }
    }
    
}

extension RequestPageViewController: UISearchBarDelegate {
    
    //When user changes the search text, filter the car plates.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCarArray = carArray.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
}

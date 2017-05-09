//
//  GraphDetailTableViewController.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/8/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class GraphDetailTableViewController: UITableViewController {
    
    var titleArray: [Date] = []
    
    var valueArray: [Int] = []
    
    let dateFormatter: DateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titleArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "graphdetailcell", for: indexPath)
        
        cell.textLabel?.text = dateFormatter.string(from: titleArray[indexPath.row])
        
        cell.detailTextLabel?.text = "value: \(valueArray[indexPath.row])"

        // Configure the cell...

        return cell
    }

}

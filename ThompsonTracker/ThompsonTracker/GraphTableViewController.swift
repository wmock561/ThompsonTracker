//
//  GraphTableViewController.swift
//  ThompsonTracker
//
//  Created by Ryan Lapeyre on 5/2/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class GraphTableViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    let surveyData = [Model.sharedInstance.fetchHyperactivity()]
    
//    let surveyData : [Any] = [Model.sharedInstance.fetchHyperactivity() , Model.sharedInstance.fecthAnxiety() ] as [Hyperactivity]//,  ] //, Model.sharedInstance.fetchHyperactivity()]
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
// 
//    }

    // MARK: - Table view data source
    

    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
      //  return surveyData.count
            return 1
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphTableViewCell
        
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        cell.dateFormatter.dateFormat = "MM/dd"
        let myData = surveyData[indexPath.row]
      //  print(Model.sharedInstance.fetchSelfHarm())
        
        var counter = 0
        
        for item in myData
        {

            cell.realData.append( ["label" + String(counter) : cell.dateFormatter.string(from: item.date) , "value" : NSNumber(value : item.value) ])
            GraphView.graphPoints.append(Int(item.value))
            //messing with static variable above will probably cause issues with average
            //take NOTE
            //
            
            counter += 1
        }
        print(cell.realData)
        let graph = GraphView(frame: CGRect(x : cell.x, y: cell.y, width: width-cell.x*2, height: height * 0.65), data: cell.realData as NSArray)
    
        cell.subView.addSubview(graph)
  

        
        graph.setNeedsDisplay()
        
        return cell
    }
    
    
 
    
}

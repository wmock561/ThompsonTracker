//
//  GraphViewController.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/23/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    @IBOutlet weak var containerView: UIView!
//    @IBOutlet weak var graphView: GraphView!
//    
//    //Labels
//    @IBOutlet weak var averageResponse: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Graphs"
        
//        let activityArray = Model.sharedInstance.fetchHyperactivity()
//        
//        for item in activityArray {
//            graphView.graphPoints.append(Int(item.value))
//        }
//        
//        setupGraphDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {

//        graphView.graphPoints.removeAll()
//        
//        let activityArray = Model.sharedInstance.fetchHyperactivity()
//        //print(activityArray)
//        
//        for item in activityArray {
//            graphView.graphPoints.append(Int(item.value))
//        }
//        
//        graphView.setNeedsDisplay()
        
        //setupGraphDisplay()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGraphDisplay() {
        
//        print(graphView.graphPoints.reduce(0, +))
//        print(graphView.graphPoints.count)
        
//        let average: Double = Double(graphView.graphPoints.reduce(0, +)) / Double(graphView.graphPoints.count)
//        
//        let doubleStr = String(format: "%.2f", average)
//        
//        averageResponse.text = "\(doubleStr)"
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "graphcell", for: indexPath) as! GraphTableViewCell
        
        //cell.graphView = GraphView(frame: cell.graphView.frame, startColor: UIColor.red, endColor: UIColor.green, graphPoints: [1,2,3,4,5])
        
        //cell.graphview =
            //cell.graphView.frame
        
//        let bcolor : UIColor = UIColor( red: 0.2, green: 0.2, blue:0.2, alpha: 0.5 )
//        
//        cell.layer.borderWidth = 0.5
//        cell.layer.borderColor = bcolor.cgColor
//        cell.layer.cornerRadius = 3
        
        cell.graphView.startColor = UIColor(colorLiteralRed: 105, green: 246, blue: 211, alpha: 1)
        cell.graphView.startColor = UIColor(colorLiteralRed: 105, green: 193, blue: 211, alpha: 1)
        
        cell.graphTitleLabel.text = "TITLE FOR GRAPH"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

}

//
//  GraphViewController.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/23/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    
    //Labels
    @IBOutlet weak var averageResponse: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Graphs"
        
        let activityArray = Model.sharedInstance.fetchHyperactivity()
        
        print(activityArray)
        
        for item in activityArray {
            graphView.graphPoints.append(Int(item.value))
        }
        
        setupGraphDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {

        graphView.graphPoints.removeAll()
        
        let activityArray = Model.sharedInstance.fetchHyperactivity()
        print(activityArray)
        
        for item in activityArray {
            graphView.graphPoints.append(Int(item.value))
        }
        
        graphView.setNeedsDisplay()
        
        setupGraphDisplay()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGraphDisplay() {
        
//        print(graphView.graphPoints.reduce(0, +))
//        print(graphView.graphPoints.count)
        
        let average: Double = Double(graphView.graphPoints.reduce(0, +)) / Double(graphView.graphPoints.count)
        
        let doubleStr = String(format: "%.2f", average)
        
        averageResponse.text = "\(doubleStr)"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

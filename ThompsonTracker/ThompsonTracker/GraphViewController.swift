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
        
        let activityArray = Model.sharedInstance.fetchHyperactivity()
        
        for item in activityArray {
            graphView.graphPoints.append(Int(item.value))
        }
        
        setupGraphDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGraphDisplay() {
        
        //Use 7 days for graph - can use any number,
        //but labels and sample data are set up for 7 days
        //let noOfDays:Int = 7
        
        //1 - replace last day with today's actual data
        //graphView.graphPoints[graphView.graphPoints.count-1] = counterView.counter
        
        //2 - indicate that the graph needs to be redrawn
        graphView.setNeedsDisplay()
        
        //maxLabel.text = "\(maxElement(graphView.graphPoints))"
        
        //3 - calculate average from graphPoints
        let average: Double = Double(graphView.graphPoints.reduce(0, +)
            / graphView.graphPoints.count)
        averageResponse.text = "\(average)"
        
        //set up labels
        //day of week labels are set up in storyboard with tags
        //today is last day of the array need to go backwards
        
        //4 - get today's day number
//        let dateFormatter = NSDateFormatter()
//        let calendar = NSCalendar.currentCalendar()
//        let componentOptions:NSCalendarUnit = .CalendarUnitWeekday
//        let components = calendar.components(componentOptions,
//                                             fromDate: NSDate())
//        var weekday = components.weekday
//        
//        let days = ["S", "S", "M", "T", "W", "T", "F"]
//        
//        //5 - set up the day name labels with correct day
//        for i in reverse(1...days.count) {
//            if let labelView = graphView.viewWithTag(i) as? UILabel {
//                if weekday == 7 {
//                    weekday = 0
//                }
//                labelView.text = days[weekday--]
//                if weekday < 0 {
//                    weekday = days.count - 1
//                }
//            }
//        }
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

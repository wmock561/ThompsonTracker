//
//  GraphViewController.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/23/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit



@IBDesignable
class GraphViewController: UIViewController {
    
    @IBOutlet weak var subView: UIView!
    let dateFormatter = DateFormatter()
    var graph = GraphView()
    var realData = [Dictionary <String, Any>]()
    let x: CGFloat = 10
    let y: CGFloat = 50

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        dateFormatter.dateFormat = "MM/dd"
        let myData = Model.sharedInstance.fetchHyperactivity()
        
        //
        var counter = 0
        
        for item in myData
        {
            realData.append( ["label" + String(counter) : dateFormatter.string(from: item.date) , "value" : NSNumber(value : item.value) ])
            GraphView.graphPoints.append(Int(item.value))
            counter += 1
        }
        print(realData)
        let graph = GraphView(frame: CGRect(x : x, y: y, width: width-x*2, height: height * 0.65), data: realData as NSArray)
        
//        subView = graph
        self.subView.addSubview(graph)
        //self.view.addSubview(graph)
        self.title = "Graphs"
    
        graph.setNeedsDisplay()
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        GraphView.graphPoints.removeAll()
        realData.removeAll()
        
        //Sean code. Look at how pretty it is!!
        
        for view in self.subView.subviews {
            view.removeFromSuperview()
        }
        
        for view in graph.subviews {
            view.removeFromSuperview()
        }
        
        self.subView.setNeedsLayout()
        self.subView.layoutIfNeeded()
        
        self.subView.setNeedsDisplay()
    
        
        let myData = Model.sharedInstance.fetchHyperactivity()
        var counter = 0
        for item in myData
        {
            realData.append( ["label" + String(counter) : dateFormatter.string(from: item.date) , "value" : NSNumber(value : item.value) ])
            GraphView.graphPoints.append(Int(item.value))
            counter += 1
        }
        let width = self.view.frame.width
        let height = self.view.frame.height
        graph = GraphView(frame: CGRect(x : x, y: y, width: width-x*2, height: height * 0.65), data: realData as NSArray)
        self.subView.addSubview(graph)
        // self.view.addSubview(graph)
        graph.setNeedsDisplay()
        
    }
    
    //
    // func setupGraphDisplay() -> String {
    
    //  let average: Double = Double(GraphView.graphPoints.reduce(0, +)) / Double(GraphView.graphPoints.count)
    //   let doubleStr = String(format: "Average : %.2f", average)
    //    let average: Double = Double(GraphView.graphPoints.reduce(0, +)) / Double(GraphView.graphPoints.count)
    //    let doubleStr = String(format: "Average : %.2f", average)
    //
    //    return doubleStr
    ////
    ////        //NS sstrings in draw on page
    ////        //    //.enumerated
    ////        //    //for(index , text)
    ////        //
    ////
    //}
    
    //}
}

//
//  GraphViewController.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/23/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var childIndex: Int?
    
    var children: [Child]?

//    @IBOutlet weak var averageResponse: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Graphs"
        
        children = Model.sharedInstance.fetchChild()
        
        if let tbc = self.tabBarController,
            let viewControllers = tbc.viewControllers,
            let dashVC = (viewControllers.first as? UINavigationController)?.viewControllers.first as? DashboardViewController{
                childIndex = dashVC.patientIndex
        }

        //print(children.first?.nickName)
        
//        let activityArray = Model.sharedInstance.fetchHyperactivity()
//        
//        for item in activityArray {
//            graphView.graphPoints.append(Int(item.value))
//        }
//        
//        setupGraphDisplay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        children = Model.sharedInstance.fetchChild()
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
    
    /*func setupGraphDisplay(indexValue: Int) -> [Int]? {
        
        switch sectionValue {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
        
//        print(graphView.graphPoints.reduce(0, +))
//        print(graphView.graphPoints.count)
        
//        let average: Double = Double(graphView.graphPoints.reduce(0, +)) / Double(graphView.graphPoints.count)
//        
//        let doubleStr = String(format: "%.2f", average)
//        
//        averageResponse.text = "\(doubleStr)"
        
        
        
    }*/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titleArray: [String] = ["Behavior", "Health", "Sleep", "Mood"]
        
        return titleArray[section]
    }
    
    let behaviourQuestionsArray = ["Attention Span", "Defiance", "Hyperactivity", "Impulsivity", "Repetition", "Self-harm", "Tantrums"]
    let healthQuestionArray = ["Stomach Ache/Pain", "Headaches","Tremors/Seizures", "Diet Problems", "Diarrhea/Constipation", "Respiratory Issues"]
    let sleepQuestionsArray = ["Quality", "Duration"]
    let moodQuestionsArray = ["Excited", "Happy", "Calm", "Anxious", "Sad", "Irritable", "Angry"]
    
    let dotColorArray = ["4A4A4A"]
    //let behaviorLineColorArray = ["D0011B", "000000", "F6A623", "D0011B", "#000000", "F6A623", "F6A623"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "graphcell", for: indexPath) as! GraphTableViewCell
        
        let sectionNum = indexPath.section
        switch sectionNum {
        case 0:
            cell.graphTitleLabel.text = behaviourQuestionsArray[indexPath.row]
            cell.graphView.lineColor = UIColor.red//UIColor(hex: behaviorLineColorArray[indexPath.row])
            
            //setting points
            switch indexPath.row {
            case 0:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.attentionSpanActivityArray{
                    
                    print(array)
                    
                    cell.graphView.graphPoints.removeAll()
                    
                    for value in array {
                        cell.graphView.graphPoints.append(Int(value.value))
                        print(Int(value.value))
                    }
                    
                }
            case 1:
                print("TESTING")
            case 2:
                print("TESTING")
            case 3:
                print("TESTING")
            case 4:
                print("TESTING")
            case 5:
                print("TESTING")
            default:
                print("ERROR in 0")
            }
        case 1:
            cell.graphTitleLabel.text = healthQuestionArray[indexPath.row]
            cell.graphView.lineColor = UIColor.blue//UIColor(hex: "000000")
            print("LineColor should be blue here")
        case 2:
            cell.graphTitleLabel.text = sleepQuestionsArray[indexPath.row]
            cell.graphView.lineColor = UIColor.green//UIColor(hex: "000000")
        case 3:
            cell.graphTitleLabel.text = moodQuestionsArray[indexPath.row]
            cell.graphView.lineColor = UIColor.purple//UIColor(hex: "000000")
        default:
            print("Section Error")
        }
        
        //cell.graphView.startColor = UIColor(hex: "FFFFFF")//(hex: "69F6D3")
        //cell.graphView.endColor = UIColor(hex: "FFFFFF")//(hex: "69C1D3")
        //cell.graphView.dotColor = UIColor(hex: dotColorArray.first!)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return behaviourQuestionsArray.count
        case 1:
            return healthQuestionArray.count
        case 2:
            return sleepQuestionsArray.count
        case 3:
            return 1
        default:
            return 0
        }
    }

}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

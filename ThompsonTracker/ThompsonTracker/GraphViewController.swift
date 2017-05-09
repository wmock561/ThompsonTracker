//
//  GraphViewController.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/23/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setup for graph colors
    
    let behaviourQuestionsArray = ["Attention Span", "Defiance", "Hyperactivity", "Impulsivity", "Repetition", "Self-harm", "Tantrums"]
    let healthQuestionArray = ["Stomach Ache/Pain", "Headaches","Tremors/Seizures", "Diet Problems", "Diarrhea/Constipation", "Respiratory Issues"]
    let sleepQuestionsArray = ["Quality", "Duration"]
    let moodQuestionsArray = ["Excited", "Happy", "Calm", "Anxious", "Sad", "Irritable", "Angry"]
    
    let behaviorDotColorArray = ["4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A"]
    let behaviorLineColorArray = ["D0011B", "000000", "F6A623", "D0011B", "#000000", "F6A623", "F6A623"]
    let behaviorsStartColorArray = ["FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF"]
    let behaviorsEndColorArray = ["FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF"]
    
    let healthDotColorArray = ["4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A"]
    let healthLineColorArray = ["D0011B", "000000", "F6A623", "D0011B", "#000000", "F6A623", "F6A623"]
    let healthStartColorArray = ["FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF"]
    let healthEndColorArray = ["FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF"]
    
    let sleepDotColorArray = ["4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A"]
    let sleepLineColorArray = ["D0011B", "000000"]
    let sleepStartColorArray = ["FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF"]
    let sleepEndColorArray = ["FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF"]
    
    let moodDotColorArray = ["4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A","4A4A4A"]
    let moodLineColorArray = ["D0011B", "000000", "F6A623", "D0011B", "#000000", "F6A623", "F6A623"]
    let moodStartColorArray = ["FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF"]
    let moodEndColorArray = ["FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF"]
    
    @IBOutlet weak var tableView: UITableView!
    
    var childIndex: Int?
    
    var children: [Child]?
    
    var attentionSpanActivityArray = [AttentionSpan]()
    var defianceActivityArray = [Defiance]()
    var hyperActivityArray = [Hyperactivity]()
    var implisivityActivityArray = [Implusivity]()
    var repetitionActivityArray = [Repetition]()
    var selfHarmActivityArray = [SelfHarm]()
    var tantrumsActivityArray = [Tantrums]()
    
    var stomachAcheActivityArray = [StomachAche]()
    var headacheActivityArray = [Headaches]()
    var tremorActivityArray = [Tremors]()
    var dietActivityArray = [Diet]()
    var diarrheaActivityArray = [Diarrhea]()
    var respiratoryActivityArray = [RespiratoryIssues]()
    
    var sleepQualityActivityArray = [SleepQuality]()
    var sleepLengthActivityArray = [SleepLength]()
    
    var selectedArrayType: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Graphs"
        
        children = Model.sharedInstance.fetchChild()
        
        if let tbc = self.tabBarController,
            let viewControllers = tbc.viewControllers,
            let dashVC = (viewControllers.first as? UINavigationController)?.viewControllers.first as? DashboardViewController{
                childIndex = dashVC.patientIndex
        }
        
        print(children?.first?.stomachAcheActivityArray ?? "NO VALUES")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        children = Model.sharedInstance.fetchChild()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGraphDisplay(indexValues: [Int]) -> Double {
        
        var average: Double = 0
        
        if indexValues.count != 0{
        
            average = Double(indexValues.reduce(0, +)) / Double(indexValues.count)
        
        }
        return average
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sectionNum = indexPath.section
        let cellNum = indexPath.row
        
        switch sectionNum {
        case 0:
            switch cellNum {
            case 0:
                selectedArrayType = "attentionSpanActivityArray"
            case 1:
                selectedArrayType = "defianceActivityArray"
            case 2:
                selectedArrayType = "hyperActivityArray"
            case 3:
                selectedArrayType = "implisivityActivityArray"
            case 4:
                selectedArrayType = "repetitionActivityArray"
            case 5:
                selectedArrayType = "selfHarmActivityArray"
            case 6:
                selectedArrayType = "tantrumsActivityArray"
            default:
                print("ERROR: Switch 0 didSelectRowAt indexPath")
            }
        case 1:
            switch cellNum {
            case 0:
                selectedArrayType = "stomachAcheActivityArray"
            case 1:
                selectedArrayType = "headacheActivityArray"
            case 2:
                selectedArrayType = "tremorActivityArray"
            case 3:
                selectedArrayType = "dietActivityArray"
            case 4:
                selectedArrayType = "diarrheaActivityArray"
            case 5:
                selectedArrayType = "respiratoryActivityArray"
            default:
                print("ERROR: Switch 1 didSelectRowAt indexPath")
            }
        case 2:
            switch cellNum {
            case 0:
                selectedArrayType = "sleepQualityActivityArray"
            case 1:
                selectedArrayType = "sleepLengthActivityArray"
            default:
                print("ERROR: Switch 2 didSelectRowAt indexPath")
                }
        case 3: break
            
        default:
            print("Section Error")
        }

        
        performSegue(withIdentifier: "todetailgraphview", sender: self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titleArray: [String] = ["Behavior", "Health", "Sleep", "Mood"]
        
        return titleArray[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "graphcell", for: indexPath) as! GraphTableViewCell
        
        
        //Setting up for Graph View
        let newGraph = GraphView()
        
        newGraph.translatesAutoresizingMaskIntoConstraints = false
        newGraph.frame = cell.graphView.frame
        newGraph.backgroundColor = .clear
        cell.graphView.addSubview(newGraph)
        
        newGraph.leadingAnchor.constraint(equalTo: cell.graphView.leadingAnchor).isActive = true
        
        newGraph.trailingAnchor.constraint(equalTo: cell.graphView.trailingAnchor).isActive = true
        
        newGraph.topAnchor.constraint(equalTo: cell.graphView.topAnchor).isActive = true
        
        newGraph.bottomAnchor.constraint(equalTo: cell.graphView.bottomAnchor).isActive = true
        
        
        //Switch for what graph to poulate with what data. this could be done more cleanly if I had more time.
        let sectionNum = indexPath.section
        let cellNum = indexPath.row
        
        switch sectionNum {
        case 0:
            
            cell.graphTitleLabel.text = behaviourQuestionsArray[cellNum]
            
            //setting points
            switch cellNum {
            case 0:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.attentionSpanActivityArray?.sorted(by: { $0.date < $1.date }) {
                
                    attentionSpanActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: behaviorLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: behaviorDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 1:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.defianceActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    defianceActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: behaviorLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: behaviorDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 2:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.hyperActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    hyperActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: behaviorLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: behaviorDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 3:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.implisivityActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    implisivityActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: behaviorLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: behaviorDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 4:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.repetitionActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    repetitionActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: behaviorLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: behaviorDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 5:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.selfHarmActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    selfHarmActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: behaviorLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: behaviorDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 6:
                
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.tantrumsActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    tantrumsActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: behaviorsStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: behaviorsEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: behaviorLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: behaviorDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            default:
                print("ERROR in 0 for switch in cellForRowAt")
            }
        case 1:
            cell.graphTitleLabel.text = healthQuestionArray[cellNum]
            
            print("in case 1")
            
            switch cellNum {
            case 0:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.stomachAcheActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    stomachAcheActivityArray = array
                    
                    print(child.nickName)
                    
                    print(stomachAcheActivityArray)
                    print("Here")
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                        
                        print(newGraph.graphPoints)
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: healthLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: healthDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 1:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.headacheActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    headacheActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: healthLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: healthDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 2:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.tremorActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    tremorActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: healthLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: healthDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 3:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.dietActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    dietActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: healthLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: healthDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 4:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.diarrheaActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    diarrheaActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: healthLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: healthDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 5:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.respiratoryActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    respiratoryActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: healthStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: healthEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: healthLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: healthDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            default:
                print("ERROR in 0 for switch in cellForRowAt")
            }
        case 2:
            cell.graphTitleLabel.text = sleepQuestionsArray[cellNum]
            
            switch cellNum {
            case 0:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.sleepQualityActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    sleepQualityActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                        
                        print(newGraph.graphPoints)
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: sleepStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: sleepStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: sleepEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: sleepEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: sleepLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: sleepDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()
                }
            case 1:
                if let index = childIndex,
                    let child = children?[index],
                    let array = child.sleepLengthActivityArray?.sorted(by: { $0.date < $1.date }) {
                    
                    sleepLengthActivityArray = array
                    
                    if array.isEmpty == false {
                        newGraph.graphPoints.removeAll()
                        
                        let value = setupGraphDisplay(indexValues: newGraph.graphPoints)
                        cell.averageValue.text = "\(value)"
                        
                        for value in array {
                            newGraph.graphPoints.append(Int(value.value))
                        }
                        
                        print(newGraph.graphPoints)
                    }
                    
                    //setting gradient colors
                    cell.drawingView.startColor = UIColor(hex: sleepStartColorArray[cellNum])
                    newGraph.startColor = UIColor(hex: sleepStartColorArray[cellNum])
                    cell.drawingView.endColor = UIColor(hex: sleepEndColorArray[cellNum])
                    newGraph.endColor = UIColor(hex: sleepEndColorArray[cellNum])
                    
                    //setting dot and line colors
                    newGraph.lineColor = UIColor(hex: sleepLineColorArray[cellNum])
                    newGraph.dotColor = UIColor(hex: sleepDotColorArray[cellNum])
                    
                    newGraph.setNeedsDisplay()

                }
            default:
                print("Error in sleep section")
            }
        case 3:
            cell.graphTitleLabel.text = moodQuestionsArray[indexPath.row]
        default:
            print("Section Error")
        }
    
        cell.draw(cell.frame)
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? GraphDetailTableViewController {

            var dateArray = [Date]()
            var valueArray = [Int]()
            
            //print(selectedArrayType)
            
            switch selectedArrayType {
            case "attentionSpanActivityArray":
                
                dateArray.removeAll()
                
                for item in attentionSpanActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
            case "defianceActivityArray":
                dateArray.removeAll()
                
                for item in defianceActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
                
            case "hyperActivityArray":
                dateArray.removeAll()
                
                for item in hyperActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
                
            case "implisivityActivityArray":
                dateArray.removeAll()
                
                for item in implisivityActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
                
            case "repetitionActivityArray":
                dateArray.removeAll()
                
                for item in repetitionActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
                
            case "selfHarmActivityArray":
                dateArray.removeAll()
                
                for item in selfHarmActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
                
            case "tantrumsActivityArray":
                dateArray.removeAll()
                
                for item in tantrumsActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
                
            case "sleepQualityActivityArray":
                dateArray.removeAll()
                
                for item in  sleepQualityActivityArray{
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
                    
            case "sleepLengthActivityArray":
                dateArray.removeAll()
                
                for item in sleepLengthActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
                
            case "stomachAcheActivityArray":
                dateArray.removeAll()
                
                for item in stomachAcheActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
            case "headacheActivityArray":
                dateArray.removeAll()
                
                for item in headacheActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
            case "tremorActivityArray":
                dateArray.removeAll()
                
                for item in tremorActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
            case "dietActivityArray":
                dateArray.removeAll()
                
                for item in dietActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
            case "diarrheaActivityArray":
                dateArray.removeAll()
                
                for item in diarrheaActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
            case "respiratoryActivityArray":
                dateArray.removeAll()
                
                for item in respiratoryActivityArray {
                    dateArray.append(item.date)
                    valueArray.append(Int(item.value))
                }
                
                destination.titleArray = dateArray
                destination.valueArray = valueArray
                
            default:
                print("bad prepare")
            }
            
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

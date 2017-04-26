//
//  DashViewController.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/16/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit
import ResearchKit

class DashDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellTitleArray: [String]?
    var cellImageArray: [UIImage]?
    
    fileprivate var selectedCells = Set<BehaviourTasks>()
    fileprivate let shareTextLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsMultipleSelection = false
        
        self.title = "Track"//\()"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
    }
    
    //IMPLEMENTATION OF Table METHODS
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //testCoreData()
        
        //print(indexPath.row)
        //        print(BehaviourTasks(rawValue: indexPath.row)!)
        selectedCells.insert((BehaviourTasks(rawValue: indexPath.row)!))
        //        print(selectedCells)
        
        var selected: [Int] = []
        selected.append(indexPath.row)
        
        let steps = pickBehaviourQuestions(indexValues: selected)
        
        let task = ORKOrderedTask(identifier: "SurveyTask", steps: steps)
        
        let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
        
        taskViewController.delegate = self
        
        present(taskViewController, animated: true, completion: {
            self.selectedCells.removeAll()
            selected.removeAll()
            //            print(selected)
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cellCount = cellTitleArray?.count{
            return cellCount
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get a reference to our storyboard cell
        
        //removing all from selectedCells Array
        selectedCells.removeAll()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "surveycell", for: indexPath) as! ActivityTableViewCell
        
        let bcolor : UIColor = UIColor( red: 0.2, green: 0.2, blue:0.2, alpha: 0.5 )
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = bcolor.cgColor
        cell.layer.cornerRadius = 3
        
        if let cellName = cellTitleArray?[indexPath.row],
            let cellImage = cellImageArray?[indexPath.row]{
            cell.titleLabel.text = cellName
            cell.cellImage.image = cellImage
        }else{
            cell.titleLabel.text =  "ERROR"
        }
        
        return cell
    }
    
    func pickBehaviourQuestions(indexValues: [Int]) ->[ORKStep]{
        var steps = [ORKStep]()
        
//        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
//        instructionStep.title = "Custom Survey"
//        instructionStep.text = "Testing Text for Survey"
//        steps += [instructionStep]
        
        let testQuestionFormat: ORKScaleAnswerFormat = ORKScaleAnswerFormat(maximumValue: 5, minimumValue: 1, defaultValue: 1, step: 1)
        for num in indexValues{
            switch num {
            case 0:
                let questionTestSteptitle = "Hyperactivity"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 1:
                let questionTestSteptitle = "Impulsivity"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 2:
                let questionTestSteptitle = "Repetition"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 3:
                let questionTestSteptitle = "Anxiety"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 4:
                let questionTestSteptitle = "Attention"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 5:
                let questionTestSteptitle = "Irritability"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 6:
                let questionTestSteptitle = "Self Harm"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 7:
                let questionTestSteptitle = "Tics"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 8:
                let questionTestSteptitle = "Defiance"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//              print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 9:
                let questionTestSteptitle = "Social Skills"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 10:
                let questionTestSteptitle = "Speech"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 11:
                let questionTestSteptitle = "Tantrums"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
//                print(testQuestionStep)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            default:
                print("ERROR IN SWITCH HERE")
                print(num)
            }
        }
        
        return steps
    }
    
    func testCoreData(){
        print("call")
        
        let activityArray = Model.sharedInstance.fetchHyperactivity()
        
        for item in activityArray{
            print("This is the item: \(item.value)")
        }
    }
    
}


extension DashDetailViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
        
        //need to change so that forStepIdentifier is correct based on what they selected????
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "HyperactivitySliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Hyperactivity(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "ImpulsivitySliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Implusivity(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "RepetitionSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Repetition(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "AnxietySliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Anxiety(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "AttentionSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = AttentionSpan(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "IrritabilitySliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Irritability(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Self HarmSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = SelfHarm(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "TicsSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Tics(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "DefianceSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Defiance(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Social SkillsSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = SocialSkills(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "SpeechSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Speech(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "TantrumsSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Tantrums(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
    }
    
    func taskViewControllerSupportsSaveAndRestore(_ taskViewController: ORKTaskViewController) -> Bool {
        return true
    }
}

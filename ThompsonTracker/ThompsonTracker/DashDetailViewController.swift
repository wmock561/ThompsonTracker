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
    var categoryIndex: Int = 5
    
    fileprivate let shareTextLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsMultipleSelection = false
        
        self.title = "Track"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
    }
    
    //IMPLEMENTATION OF Table METHODS
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selected: [Int] = []
        
        selected.append(indexPath.row)
        
        var steps: [ORKStep]?
        
        switch categoryIndex {
        case 0:
            steps = pickBehaviourQuestions(indexValues: selected)
        case 1:
            steps = pickHealthQuestions(indexValues: selected)
        case 2:
            steps = pickSleepQuestions(indexValues: selected)
        case 3:
            steps = pickEmotionsQuestions(indexValues: selected)
        default:
            print("Error in didSelectRowAt inital switch")
        }
        
        let task = ORKOrderedTask(identifier: "SurveyTask", steps: steps)
        
        let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
        
        taskViewController.delegate = self
        
        taskViewController.navigationBar.tintColor = UIColor(red:0.41, green:0.76, blue:0.83, alpha:1.0)
        
        taskViewController.editButtonItem.tintColor = UIColor(red:0.41, green:0.76, blue:0.83, alpha:1.0)
        
        //figure out how to change tint on researchkit buttons
        
        present(taskViewController, animated: true, completion: {
            selected.removeAll()
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
    
    //MARK: - Behaviour func
    func pickBehaviourQuestions(indexValues: [Int]) ->[ORKStep]{
        var steps = [ORKStep]()
        
        let testQuestionFormat: ORKScaleAnswerFormat = ORKScaleAnswerFormat(maximumValue: 5, minimumValue: 1, defaultValue: 1, step: 1)
        
        for num in indexValues{
            switch num {
            case 0:
                let questionTestSteptitle = "Hyperactivity"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 1:
                let questionTestSteptitle = "Impulsivity"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 2:
                let questionTestSteptitle = "Repetition"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 3:
                let questionTestSteptitle = "Anxiety"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 4:
                let questionTestSteptitle = "Attention"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 5:
                let questionTestSteptitle = "Irritability"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 6:
                let questionTestSteptitle = "Self Harm"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 7:
                let questionTestSteptitle = "Tics"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 8:
                let questionTestSteptitle = "Defiance"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 9:
                let questionTestSteptitle = "Social Skills"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 10:
                let questionTestSteptitle = "Speech"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 11:
                let questionTestSteptitle = "Tantrums"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            default:
                print("ERROR IN SWITCH HERE")
                print(num)
            }
        }
        
        return steps
    }
    
    //MARK: - Health func
    func pickHealthQuestions(indexValues: [Int]) ->[ORKStep]{
        var steps = [ORKStep]()
        
        let testQuestionFormat: ORKScaleAnswerFormat = ORKScaleAnswerFormat(maximumValue: 5, minimumValue: 1, defaultValue: 1, step: 1)
        
        for num in indexValues{
            switch num {
            case 0:
                let questionTestSteptitle = "Stomach Ache/Pain"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 1:
                let questionTestSteptitle = "Headaches"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 2:
                let questionTestSteptitle = "Tremors/Seizures"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 3:
                let questionTestSteptitle = "Diet Problems"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 4:
                let questionTestSteptitle = "Diarrhea/Constipation"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 5:
                let questionTestSteptitle = "Respiratory Issues"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
            default:
                print("ERROR IN SWITCH HERE")
                print(num)
            }
        }
        
        return steps
    }
    
    //MARK: - Sleep func
    func pickSleepQuestions(indexValues: [Int]) ->[ORKStep]{
        var steps = [ORKStep]()
        
        for num in indexValues{
            switch num {
            case 0:
                let questionTestSteptitle = "Quality"
                let testQuestionFormat: ORKScaleAnswerFormat = ORKScaleAnswerFormat(maximumValue: 5, minimumValue: 1, defaultValue: 1, step: 1)
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) of sleep on a scale of 1-5."
                steps += [testQuestionStep]
                
            case 1:
                let questionTestSteptitle = "Duration"
                let testQuestionFormat: ORKTimeIntervalAnswerFormat = ORKTimeIntervalAnswerFormat(defaultInterval: 8, step: 15)
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)TimeIntervalQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please record \(questionTestSteptitle) of sleep"
                steps += [testQuestionStep]
                
                //Make multi-step question for what time they went to sleep and when they woke up?
            default:
                print("ERROR IN SWITCH HERE")
                print(num)
            }
        }
        
        return steps
    }
    
    //MARK: - Emotions func
    func pickEmotionsQuestions(indexValues: [Int]) ->[ORKStep]{
        var steps = [ORKStep]()
        
        let testQuestionFormat: ORKScaleAnswerFormat = ORKScaleAnswerFormat(maximumValue: 5, minimumValue: 1, defaultValue: 1, step: 1)
        
        for num in indexValues{
            switch num {
            case 0:
                let questionTestSteptitle = "Angry"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 1:
                let questionTestSteptitle = "Happy"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 2:
                let questionTestSteptitle = "Sad"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 3:
                let questionTestSteptitle = "Scared"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 4:
                let questionTestSteptitle = "OK"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 5:
                let questionTestSteptitle = "Stressed"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
            default:
                print("ERROR IN SWITCH HERE")
                print(num)
            }
        }
        
        return steps
    }
    
}


extension DashDetailViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
        
        //need to change so that forStepIdentifier is correct based on what they selected????
        
        //Behavior Answer Saving
        
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
        
        //Health Answer Saving
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Stomach Ache/PainSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = StomachAche(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "HeadachesSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Headaches(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Tremors/SeizuresSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Tremors(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Diet ProblemsSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Diet(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Diarrhea/ConstipationSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Diarrhea(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Respiratory IssuesSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = RespiratoryIssues(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        //Sleep Answer Saving
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "QualitySliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = SleepQuality(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        //FLOAT CASE HERE NEED TO CONFIRM WORKS
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "LengthTimeIntervalQuestionStep")?.results?[0].value(forKey: "answer") as? Float{
            
            _ = SleepLength(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        //Mood Answer Saving
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "HappySliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Happy(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "SadSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Sad(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "StressedSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Stressed(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "ScaredSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Scared(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "AngrySliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Angry(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "OKSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = OK(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
        }
        
        
    }
    
    func taskViewControllerSupportsSaveAndRestore(_ taskViewController: ORKTaskViewController) -> Bool {
        return false
    }
}

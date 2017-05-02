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
            pickEmotionsQuestions(indexValues: selected)
            steps = nil
        default:
            print("Error in didSelectRowAt inital switch")
        }
    
        if let steps = steps{
            
            let task = ORKOrderedTask(identifier: "SurveyTask", steps: steps)
            
            let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
            
            taskViewController.delegate = self
            
            taskViewController.navigationBar.tintColor = UIColor(red:0.41, green:0.76, blue:0.83, alpha:1.0)
            
            taskViewController.editButtonItem.tintColor = UIColor(red:0.41, green:0.76, blue:0.83, alpha:1.0)
            
            //TODO: figure out how to change tint on researchkit buttons
            
            present(taskViewController, animated: true, completion: {
                selected.removeAll()
            })
        }
        
        //stop cell highlighting
        self.tableView.deselectRow(at: indexPath, animated: true)
        
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
                let questionTestSteptitle = "Attention"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 1:
                let questionTestSteptitle = "Defiance"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 2:
                let questionTestSteptitle = "Hyperactivity"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 3:
                let questionTestSteptitle = "Impulsivity"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 4:
                let questionTestSteptitle = "Self Harm"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
            case 5:
                
                let questionTestSteptitle = "Repetition"
                let testQuestionStep = ORKQuestionStep(identifier: "\(questionTestSteptitle)SliderChoiceQuestionStep", title: questionTestSteptitle, answer: testQuestionFormat)
                testQuestionStep.text = "Please rate \(questionTestSteptitle) on a scale of 1-5"
                steps += [testQuestionStep]
                
            case 6:
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
    
    //THIS WILL BE MODIFIED TO NOT LAUNCH A RESEARCHKIT SURVEY
    func pickEmotionsQuestions(indexValues: [Int]){
        for num in indexValues{
            switch num {
            case 0:
                _ = Excited(date: Date(), value: 7)
                Model.sharedInstance.saveContext()
                //Alert
                let alert = UIAlertController(title: "Saved Data!", message: "Excited activity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                }))
                alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                    self.backSegue()
                }))
                self.present(alert, animated: true, completion: nil)
                
            case 1:
                _ = Happy(date: Date(), value: 6)
                Model.sharedInstance.saveContext()
                //Alert
                let alert = UIAlertController(title: "Saved Data!", message: "Happy activity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                }))
                alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                    self.backSegue()
                }))
                self.present(alert, animated: true, completion: nil)
                
            case 2:
                _ = Calm(date: Date(), value: 5)
                Model.sharedInstance.saveContext()
                //Alert
                let alert = UIAlertController(title: "Saved Data!", message: "Calm activity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                }))
                alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                    self.backSegue()
                }))
                self.present(alert, animated: true, completion: nil)
                
            case 3:
                _ = Anxiety(date: Date(), value: 4)
                Model.sharedInstance.saveContext()
                //Alert
                let alert = UIAlertController(title: "Saved Data!", message: "Anxious activity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                }))
                alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                    self.backSegue()
                }))
                self.present(alert, animated: true, completion: nil)
                
            case 4:
                _ = Sad(date: Date(), value: 3)
                Model.sharedInstance.saveContext()
                //Alert
                let alert = UIAlertController(title: "Saved Data!", message: "Sad activity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                }))
                alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                    self.backSegue()
                }))
                self.present(alert, animated: true, completion: nil)
            case 5:
                _ = Irritability(date: Date(), value: 2)
                Model.sharedInstance.saveContext()
                //Alert
                let alert = UIAlertController(title: "Saved Data!", message: "Irritable activity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                }))
                alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                    self.backSegue()
                }))
                self.present(alert, animated: true, completion: nil)
                
            case 6:
                _ = Angry(date: Date(), value: 1)
                Model.sharedInstance.saveContext()
                //Alert
                let alert = UIAlertController(title: "Saved Data!", message: "Angry activity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                }))
                alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                    (alertAction)-> Void in
                    self.backSegue()
                }))
                self.present(alert, animated: true, completion: nil)
                
            default:
                print("ERROR IN SWITCH HERE")
                print(num)
            }
        }
    }
    
    func backSegue() {
        self.navigationController?.popViewController(animated: true)
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
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Hyperactivity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            

            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "ImpulsivitySliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Implusivity(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Implusive activity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "RepetitionSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Repetition(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Repeating actions have been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "AttentionSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = AttentionSpan(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Attention span has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Self HarmSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = SelfHarm(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Self harm activity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "DefianceSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Defiance(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Defiant activity has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "TantrumsSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Tantrums(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Tantrum has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        //Health Answer Saving
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Stomach Ache/PainSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = StomachAche(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Stomach Ache has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "HeadachesSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Headaches(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Headaches have been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Tremors/SeizuresSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Tremors(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Tremors have been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Diet ProblemsSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Diet(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Diet has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Diarrhea/ConstipationSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = Diarrhea(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Diarrhea has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "Respiratory IssuesSliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = RespiratoryIssues(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Respiratory Issues has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        //Sleep Answer Saving
        
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "QualitySliderChoiceQuestionStep")?.results?[0].value(forKey: "answer") as? Int{
            
            _ = SleepQuality(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Sleep Quality has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        //FLOAT CASE HERE NEED TO CONFIRM WORKS
        if let answer = taskViewController.result.stepResult(forStepIdentifier: "LengthTimeIntervalQuestionStep")?.results?[0].value(forKey: "answer") as? Float{
            
            _ = SleepLength(date: Date(), value: answer)
            Model.sharedInstance.saveContext()
            
            //Alert
            let alert = UIAlertController(title: "Saved Data!", message: "Sleep Duration has been tracked!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
            }))
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: {
                (alertAction)-> Void in
                self.backSegue()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        //Mood saving done on selection
        
        
    }
    
    func taskViewControllerSupportsSaveAndRestore(_ taskViewController: ORKTaskViewController) -> Bool {
        return false
    }
}

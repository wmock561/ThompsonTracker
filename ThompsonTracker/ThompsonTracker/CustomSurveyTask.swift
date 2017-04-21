//
//  CustomSurveyTask.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/18/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import ResearchKit
import UIKit

class CustomSurveyTask: NSObject, ORKTask {
    
    let introStepID = "intro_step"
    let nameStepID = "name_step"
    let questStepID = "quest_step"
    let colorStepID = "color_step"
    let summaryStepID = "summary_step"
    
    func questStep(name: String?) -> ORKStep {
        var questQuestionStepTitle = "What is your quest?"
        
        if let name = name {
            questQuestionStepTitle = "What is your quest, \(name)?"
        }
        
        let textChoices = [ ORKTextChoice(text: "Create a ResearchKit App", value: 0 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Seek the Holy Grail", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Find a shrubbery", value: 2 as NSCoding & NSCopying & NSObjectProtocol)]
        
        let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
        
        return ORKQuestionStep(identifier: questStepID, title: questQuestionStepTitle, answer: questAnswerFormat)
    }
    
    public var identifier: String {
        get { return "survey"}
    }
    
    public func step(before step: ORKStep?, with result: ORKTaskResult) -> ORKStep? {
        switch step?.identifier {
        case .some(nameStepID):
            return stepWithIdentifier(identifier: introStepID)
        case .some(questStepID):
            return stepWithIdentifier(identifier: nameStepID)
        case .some(colorStepID):
            // TODO
            return questStep(name: nil)
        case .some(summaryStepID):
            return stepWithIdentifier(identifier: colorStepID)
        default:
            return nil
        }
    }
    
    func step(after step: ORKStep?, with result: ORKTaskResult) -> ORKStep? {
        switch step?.identifier {
        case .none:
            return stepWithIdentifier(identifier: introStepID)
        case .some(introStepID):
            return stepWithIdentifier(identifier: nameStepID)
        case .some(nameStepID):
            // TODO
            return questStep(name: nil)
        case .some(questStepID):
            return stepWithIdentifier(identifier: colorStepID)
        case .some(colorStepID):
            return stepWithIdentifier(identifier: summaryStepID)
        default:
            return nil
            
        }
    }
    
    public func stepWithIdentifier(identifier: String) -> ORKStep? {
        switch identifier {
            
        case introStepID:
            let instructionStep = ORKInstructionStep(identifier: introStepID)
            instructionStep.title = "The Questions Three"
            instructionStep.text = "Who would cross the Bridge of Death must answer me these questions three, ere the other side they see."
            return instructionStep
            
        case nameStepID:
            let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
            nameAnswerFormat.multipleLines = false
            let nameQuestionStepTitle = "What is your name?"
            return ORKQuestionStep(identifier: nameStepID, title: nameQuestionStepTitle, answer: nameAnswerFormat)
            
        case questStepID:
            return questStep(name: "")
            
        case colorStepID:
            let colorQuestionStepTitle = "What is your favorite color?"
            let colorTuples = [
                (UIImage(named: "red")!, "Red"),
                (UIImage(named: "orange")!, "Orange"),
                (UIImage(named: "yellow")!, "Yellow"),
                (UIImage(named: "green")!, "Green"),
                (UIImage(named: "blue")!, "Blue"),
                (UIImage(named: "purple")!, "Purple")
            ]
            var imageChoices:[ORKImageChoice] = []
            for (image, name) in colorTuples {
                imageChoices.append(ORKImageChoice(normalImage: image, selectedImage: nil, text: name, value: name as NSCoding & NSCopying & NSObjectProtocol))
            }
            let colorAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: imageChoices)
            return ORKQuestionStep(identifier: colorStepID, title: colorQuestionStepTitle, answer: colorAnswerFormat)
            
        case summaryStepID:
            let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
            summaryStep.title = "Right. Off you go!"
            summaryStep.text = "That was easy!"
            return summaryStep
            
        default:
            return nil
        }
    }
}

//
//  Model.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/20/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Model {
    
    // MARK: - Properties
    var managedContext: NSManagedObjectContext?
    
    // MARK: Static
    static var sharedInstance: Model = Model()
    
    // MARK: - Initializer
    init() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let persistentContainer = appDelegate?.persistentContainer
        managedContext = persistentContainer?.viewContext
    }
    
    // MARK: - Core Data Functions
    func loadData() {
        let coreDataLoadedKey = "hasLoadedCoreData"
        
        guard !UserDefaults.standard.bool(forKey: coreDataLoadedKey) else { return }
        
//        let newsCategories = NewsJSONLoader.load(fileName: "news")
//        
//        for newsCategory in newsCategories {
//            if let category = Category(title: newsCategory.title){
//                for newsArticle in newsCategory.articles {
//                    if let article = Article(title: newsArticle.title, date: newsArticle.date){
//                        category.addToArticles(article)
//                    }
//                }
//            }
//        }
        
        do {
            try self.managedContext?.save()
            
            UserDefaults.standard.set(true, forKey: coreDataLoadedKey)
        } catch {
            return
        }
    }
    
    
    func fetchActivity() -> [Activity] {
        do {
            let array = try managedContext?.fetch(Activity.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    //MARK: - Behavior Fetch Functions
    
    func fetchHyperactivity() -> [Hyperactivity]{
        do {
            let array = try managedContext?.fetch(Hyperactivity.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fecthAnxiety() -> [Anxiety]{
        do {
            let array = try managedContext?.fetch(Anxiety.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchTics() -> [Tics]{
        do {
            let array = try managedContext?.fetch(Tics.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchIrritability() -> [Irritability]{
        do {
            let array = try managedContext?.fetch(Irritability.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchRepetition() -> [Repetition]{
        do {
            let array = try managedContext?.fetch(Repetition.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchSocialSkills() -> [SocialSkills]{
        do {
            let array = try managedContext?.fetch(SocialSkills.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchSelfHarm() -> [SelfHarm]{
        do {
            let array = try managedContext?.fetch(SelfHarm.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchDefiance() -> [Defiance]{
        do {
            let array = try managedContext?.fetch(Defiance.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchSpeech() -> [Speech]{
        do {
            let array = try managedContext?.fetch(Speech.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchTantrums() -> [Tantrums]{
        do {
            let array = try managedContext?.fetch(Tantrums.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchImplusivity() -> [Implusivity]{
        do {
            let array = try managedContext?.fetch(Implusivity.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchAttentionSpan() -> [AttentionSpan]{
        do {
            let array = try managedContext?.fetch(AttentionSpan.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    //MARK: - Sleep Fetch Functions
    
    func fetchSleepLength() -> [SleepLength]{
        do {
            let array = try managedContext?.fetch(SleepLength.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func fetchSleepQuality() -> [SleepQuality]{
        do {
            let array = try managedContext?.fetch(SleepQuality.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    
    
    //MARK: - saveContext Function
    func saveContext() {
        guard let context = managedContext,
            context.hasChanges else { return }
        
        try? context.save()
    }
}

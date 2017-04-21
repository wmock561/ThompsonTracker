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
    
    func fetchHyperactivity() -> [Hyperactivity]{
        do {
            let array = try managedContext?.fetch(Hyperactivity.fetchRequest()) ?? []
            return array
        } catch {
            return[]
        }
    }
    
    func saveContext() {
        guard let context = managedContext,
            context.hasChanges else { return }
        
        try? context.save()
    }
}

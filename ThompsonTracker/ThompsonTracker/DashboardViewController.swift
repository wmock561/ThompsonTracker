//
//  DashboardViewController.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/17/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var dashboardCollectionView: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!
    
    let cellTitles = ["Behavior", "Health", "Sleep", "Mood"]
    let cellImages = [#imageLiteral(resourceName: "mentalHealth.png"), #imageLiteral(resourceName: "health.png"), #imageLiteral(resourceName: "sleep.png"), #imageLiteral(resourceName: "happy.png")]
    
    //categories
    let behaviourQuestionsArray = ["Hyperactivity", "Impulsivity", "Repetition", "Anxiety", "Attention Span", "Irritability", "Self-harm", "Tics", "Defiance", "Social Skills", "Speech", "Tantrums"]
    let healthArray = ["Stomach Ache/Pain", "Headaches","Tremors/Seizures", "Diet Problems", "Diarrhea/Constipation", "Respiratory Issues"]
    let sleepQuestionsArray = ["Quality", "Length"]
    let moodQuestionsArray = ["Angry", "Happy", "Sad", "Scared", "OK", "Stressed"]
    
    //categoryImages
    let behaviourQuestionImageArray = [#imageLiteral(resourceName: "brain.png"), #imageLiteral(resourceName: "lightning.png"), #imageLiteral(resourceName: "refresh.png"), #imageLiteral(resourceName: "anxiety.png"), #imageLiteral(resourceName: "headache.png"), #imageLiteral(resourceName: "irritability.png"), #imageLiteral(resourceName: "sadFace.png"), #imageLiteral(resourceName: "ticks.png"), #imageLiteral(resourceName: "frustratedFace.png"), #imageLiteral(resourceName: "handshake.png"), #imageLiteral(resourceName: "speech.png"), #imageLiteral(resourceName: "angryFace.jpg")]
    let healthQuestionImageArray = [#imageLiteral(resourceName: "digestiveSystem.png"), #imageLiteral(resourceName: "headache.png"), #imageLiteral(resourceName: "ticks.png"), #imageLiteral(resourceName: "diet.png"), #imageLiteral(resourceName: "poop.png"), #imageLiteral(resourceName: "lungs.png")]
    let sleepQuestionImageArray = [#imageLiteral(resourceName: "sleep.png"),#imageLiteral(resourceName: "calendar.png")]
    let moodQuestionImageArray = [#imageLiteral(resourceName: "angryFace.jpg"), #imageLiteral(resourceName: "happy.png"), #imageLiteral(resourceName: "sadFace.png"), #imageLiteral(resourceName: "sickFace.png"), #imageLiteral(resourceName: "neutralFace.png"), #imageLiteral(resourceName: "frustratedFace.png")]
    
    //dateFormatter
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dashboard"
        
        //dashboardCollectionView.layer.borderColor = UIColor.black.cgColor
        
        dateFormatter.dateStyle = .medium
        
        let currentDate = Date()
        
        dateLabel.text = dateFormatter.string(from: currentDate)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categorycell", for: indexPath) as! DashboardCollectionViewCell
        
        //cell.backgroundColor = UIColor.blue // make cell more visible in our example project
        //cell.
        
        cell.cellImage.image = cellImages[indexPath.row]
        cell.titleLabel.text = cellTitles[indexPath.row] //Fill Dynamically from array
        //cell.cellImage.image = cellImages[indexPath.row]
        
        let bcolor : UIColor = UIColor( red: 0.2, green: 0.2, blue:0.2, alpha: 0.5 )
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = bcolor.cgColor
        cell.layer.cornerRadius = 3
        
        return cell
    }
    
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DashDetailViewController,
            let cell = sender as? DashboardCollectionViewCell{
            
            if let row = dashboardCollectionView.indexPath(for: cell)?.row{
                
                //print(row)
                
                //TODO: fix the nil cases once we have the questions from the designers
                
                switch row {
                case 0:
                    destination.cellTitleArray = behaviourQuestionsArray
                    destination.cellImageArray = behaviourQuestionImageArray
                    destination.categoryIndex = row
                case 1:
                    destination.cellTitleArray = healthArray
                    destination.cellImageArray = healthQuestionImageArray
                    destination.categoryIndex = row
                case 2:
                    destination.cellTitleArray = sleepQuestionsArray
                    destination.cellImageArray = sleepQuestionImageArray
                    destination.categoryIndex = row
                case 3:
                    destination.cellTitleArray = moodQuestionsArray
                    destination.cellImageArray = moodQuestionImageArray
                    destination.categoryIndex = row
                default:
                    print("Error in switch")
                }
                
            }
            
        }
    }

}

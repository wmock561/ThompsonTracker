//
//  DashboardViewController.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/17/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {//, CLLocationManagerDelegate {

    //var patient: Patient?
    //performSegue(withIdentifier: "childlist", sender: self)
    
    @IBOutlet weak var dashboardCollectionView: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var patientNameLabel: UILabel!
    
    @IBOutlet weak var childImage: UIImageView!
    
    var patientName: String?
//
//    @IBOutlet weak var patientPhoto: UIImageView!
//    @IBOutlet weak var patientNickname: UILabel!
//    @IBOutlet weak var patientFullname: UILabel!
    
    let cellTitles = ["Behavior", "Health", "Sleep", "Mood"]
    let cellImages = [#imageLiteral(resourceName: "behaviorHead.png"), #imageLiteral(resourceName: "health problems.png"), #imageLiteral(resourceName: "sleep.png"), #imageLiteral(resourceName: "mood.png")]
    
    //categories
    let behaviourQuestionsArray = ["Attention Span", "Defiance", "Hyperactivity", "Impulsivity", "Repetition", "Self-harm", "Tantrums"]
    let healthArray = ["Stomach Ache/Pain", "Headaches","Tremors/Seizures", "Diet Problems", "Diarrhea/Constipation", "Respiratory Issues"]
    let sleepQuestionsArray = ["Quality", "Duration"]
    let moodQuestionsArray = ["Excited", "Happy", "Calm", "Anxious", "Sad", "Irritable", "Angry"]
    
    //categoryImages
    let behaviourQuestionImageArray = [#imageLiteral(resourceName: "short attention span.png"), #imageLiteral(resourceName: "Defiant.png"), #imageLiteral(resourceName: "Hyperactivity.png"), #imageLiteral(resourceName: "impulsivity.png"), #imageLiteral(resourceName: "behaviors.png"), #imageLiteral(resourceName: "selfHarmFixed.png"), #imageLiteral(resourceName: "Tantrums.png")]
    let healthQuestionImageArray = [#imageLiteral(resourceName: "digestiveSystem.png"), #imageLiteral(resourceName: "headache.png"), #imageLiteral(resourceName: "ticks.png"), #imageLiteral(resourceName: "diet.png"), #imageLiteral(resourceName: "Diarrhea.png"), #imageLiteral(resourceName: "lungs.png")]
    let sleepQuestionImageArray = [#imageLiteral(resourceName: "sleep.png"),#imageLiteral(resourceName: "calendar.png")]
    let moodQuestionImageArray = [#imageLiteral(resourceName: "Excited.png"), #imageLiteral(resourceName: "happy.png"), #imageLiteral(resourceName: "Calm.png"), #imageLiteral(resourceName: "Anxious.png"), #imageLiteral(resourceName: "sad.png"), #imageLiteral(resourceName: "irritable.png"), #imageLiteral(resourceName: "Angry.png")]
    
    //dateFormatter
    let dateFormatter = DateFormatter()
    
    //LocationManager
//    let locationManager = CLLocationManager()
//    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "Dashboard"
        
        self.title = "Dashboard"
        
        //Tap Gesture Recognizer
        
        let recognizer = UITapGestureRecognizer() // Creates a tap gesture recognzier
        recognizer.numberOfTapsRequired = 1 // Sets the number of taps
        recognizer.addTarget(self, action: #selector(showModal(sender:))) // Sets the action triggered on tap
        
        childImage.addGestureRecognizer(recognizer) // Adds the recognizer to the pie chart
        
        if let name = patientName{
            self.patientNameLabel.text = name
        }
        
        //changing custom color for tabBarController
        
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(red:0.41, green:0.76, blue:0.83, alpha:1.0)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red:0.41, green:0.76, blue:0.83, alpha:1.0)
        
        //navigation bar text navigation color
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.41, green:0.76, blue:0.83, alpha:1.0)
        
        self.tabBarController?.tabBar.tintColor = UIColor(red:0.41, green:0.76, blue:0.83, alpha:1.0)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red:0.41, green:0.76, blue:0.83, alpha:1.0)]
        
        
        //Setting Dateformatter Style
        dateFormatter.dateStyle = .medium
        
        let currentDate = Date()
        
        dateLabel.text = dateFormatter.string(from: currentDate)
        
//        patientPhoto.image = patient?.photo
//        patientNickname.text = patient?.nickname
//        patientFullname.text = (patient?.firstname)! + " " + (patient?.lastname)!
        
//        locationManager.requestAlwaysAuthorization()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startUpdatingLocation()
//        
//        print("HERE")
//        if let currentLocation = currentLocation{
//            print(currentLocation.coordinate.latitude)
//            print(currentLocation.coordinate.longitude)
//        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        self.currentLocation = locations[0]
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error)
//    }

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
        
        cell.cellImage.image = cellImages[indexPath.row]
        cell.titleLabel.text = cellTitles[indexPath.row] //Fill Dynamically from array
        //cell.cellImage.image = cellImages[indexPath.row]
        
        let bcolor : UIColor = UIColor( red: 0.2, green: 0.2, blue:0.2, alpha: 0.5 )
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = bcolor.cgColor
        cell.layer.cornerRadius = 3
        
        return cell
    }
    
    func showModal(sender: AnyObject) {
        performSegue(withIdentifier: "childlist", sender: sender)
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

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
    
    let cellTitles = ["Behaviour", "Health", "Sleep", "Test"]
    let behaviourQuestionsArray = ["Hyperactivity", "Impulsivity", "Repitition", "Anxiety", "Attention Span", "Irritability", "Self-harm", "Tics", "Defiance", "Social Skills", "Speech", "Tantrums"]
    let healthArray = [""]
    let sleepQuestionsArray = [""]
    let giQuestionsArray = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        layout.
//        dashboardCollectionView.collectionViewLayout = layout

        // Do any additional setup after loading the view.
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
        
        cell.titleLabel.text = cellTitles[indexPath.row] //Fill Dynamically from array
        
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
                
                print(row)
                
                //TODO: fix the nil cases once we have the questions from the designers
                
                switch row {
                case 0:
                    destination.cellTitleArray = behaviourQuestionsArray
                case 1:
                    destination.cellTitleArray = nil
                case 2:
                    destination.cellTitleArray = nil
                case 3:
                    destination.cellTitleArray = nil
                default:
                    print("Error in switch")
                }
                
            }
            
        }
    }

}

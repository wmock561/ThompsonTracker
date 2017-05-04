//
//  PatientViewController.swift
//  ThompsonTracker
//
//  Created by Thunpisit Amnuaikiatloet on 4/26/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

struct Patient {
    
    var nickname: String
    var firstname: String
    var lastname: String
    var birthdate: Date
    var doctor: String
    var hospital: String
    var photo: UIImage
    
    init(nickname: String, firstname: String, lastname: String, birthdate: Date, doctor: String, hospital: String, photo: UIImage) {
        self.nickname = nickname
        self.firstname = firstname
        self.lastname = lastname
        self.birthdate = birthdate
        self.doctor = doctor
        self.hospital = hospital
        self.photo = photo
    }
}

class PatientViewController: UIViewController {

    var patients: [Patient]? = []

    
    @IBOutlet weak var tableview: UITableView!
    
    lazy var formatRawDate: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return formatter
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .long
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Child List"
        createDummyPatient()
        tableview.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //self.navigationController?.popToRootViewController(animated: <#T##Bool#>)
        
        if let destination = segue.destination as? DashboardViewController,
        let indexPath = tableview.indexPathForSelectedRow {
            //destination.patient = patient
            
            destination.patientName = "TEST NAME"
            
        }
    }
    
    func createDummyPatient(){
        
        let date = "2017-04-26T17:55:16+0000"
        
        patients?.append(Patient(nickname: "James", firstname: "Jamerson", lastname: "Doe", birthdate: formatRawDate.date(from: date)!, doctor: "Dr.Shawn Moore, PhD", hospital: "University of Missouri Health Care", photo: #imageLiteral(resourceName: "James")))
        
        patients?.append(Patient(nickname: "Alex", firstname: "Alexander", lastname: "Turner", birthdate: formatRawDate.date(from: date)!, doctor: "Dr.Shawn Moore, PhD", hospital: "University of Missouri Health Care", photo: #imageLiteral(resourceName: "Alex")))
    }

    func getPatientFromCoreData(){
    
    }
}

extension PatientViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath)
        
        if let cell = cell as? PatientTableViewCell, let patient = patients?[indexPath.row] {
            cell.patientNickname.text = patient.nickname
            cell.patientFullname.text = patient.firstname + " " + patient.lastname
            cell.patientUpdatedDate.text = dateFormatter.string(from: patient.birthdate)
            cell.patientDoctor.text = patient.doctor
            cell.patientImage.image = patient.photo
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
//        let share = UITableViewRowAction(style: .normal, title: "Share") { action, index in
//            print("Share tapped")
//
//            let link = "Hello this is Thompson Tracker"
//            
//            // set up activity view controller
//            let textToShare = [ link ]
//            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
//            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
//            
//            // exclude some activity types from the list (optional)
//            activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.assignToContact, UIActivityType.openInIBooks, UIActivityType.postToFlickr, UIActivityType.print, UIActivityType.postToVimeo, UIActivityType.addToReadingList]
//            
//            // present the view controller
//            self.present(activityViewController, animated: true, completion: nil)
//            
//            self.tableview.setEditing(false, animated: true)
//        }
//        share.backgroundColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { action, index in

            self.patients?.remove(at: indexPath.row)
            self.tableview.reloadData()
            self.tableview.setEditing(false, animated: true)
            print("Delete tabbed")
        }
        delete.backgroundColor = UIColor.red
        return [delete]
    }
    
    //Deselect row after select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
    }
    
    //Allow row to be editable
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        tableview.cellForRow(at: indexPath!)
    }
}

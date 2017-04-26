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
    
    init(nickname: String, firstname: String, lastname: String, birthdate: Date, doctor: String, hospital: String) {
        self.nickname = nickname
        self.firstname = firstname
        self.lastname = lastname
        self.birthdate = birthdate
        self.doctor = doctor
        self.hospital = hospital
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
        
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createDummyPatient()
        tableview.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DashboardViewController,
        let indexPath = tableview.indexPathForSelectedRow,
        let numReviews = patients?.count,
        indexPath.row < numReviews,
        let patient = patients?[indexPath.row] {
            destination.patient = patient
        }
    }
    
    func createDummyPatient(){
        
        let date = "2017-04-26T17:55:16+0000"
        
        patients?.append(Patient(nickname: "Johnny", firstname: "John", lastname: "Doe", birthdate: formatRawDate.date(from: date)!, doctor: "Dr.Shawn Moore, PhD", hospital: "University of Missouri Health Care"))
        
        patients?.append(Patient(nickname: "Billy", firstname: "Bill", lastname: "Turner", birthdate: formatRawDate.date(from: date)!, doctor: "Dr.Shawn Moore, PhD", hospital: "University of Missouri Health Care"))
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
        }
        
        return cell
    }
}

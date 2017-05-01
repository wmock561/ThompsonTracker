//
//  AddPatientViewController.swift
//  ThompsonTracker
//
//  Created by Thunpisit Amnuaikiatloet on 4/27/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit
import Foundation

class AddPatientViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var patient: Patient?
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func addPatient(_ sender: UIBarButtonItem) {
        
        let nickname = gatherNickname()
        let firstname = gatherFirstname()
        let lastname = gatherLastname()
        let birthdate = gatherBirthdate()
        let doctor = gatherDoctor()
        let hospital = gatherHospital()
        let photo = gatherPhoto()
        
        var patient = Patient(nickname: nickname, firstname: firstname, lastname: lastname, birthdate: birthdate, doctor: doctor, hospital: hospital, photo: photo)
    }
    
    @discardableResult func gatherPhoto() -> UIImage {
        let photocell = tableview.cellForRow(at: IndexPath(row: 1, section: 0)) as? PhotoTableViewCell
        let photo = photocell?.photoImage.image
        return photo!
    }
    
    @discardableResult func gatherNickname() -> String {
        let nicknamecell = tableview.cellForRow(at: IndexPath(row: 2, section: 0)) as? NicknameTableViewCell
        let nickname = nicknamecell?.nicknameTextfield?.text ?? ""
        return nickname
    }
    
    @discardableResult func gatherFirstname() -> String {
        let firstnamecell = tableview.cellForRow(at: IndexPath(row: 3, section: 0)) as? FirstnameTableViewCell
        let firstname = firstnamecell?.firstnameTextfield?.text ?? ""
        return firstname
    }
    
    @discardableResult func gatherLastname() -> String {
        let lastnamecell = tableview.cellForRow(at: IndexPath(row: 4, section: 0)) as? LastnameTableViewCell
        let lastname = lastnamecell?.lastnameTextfield?.text ?? ""
        return lastname
    }
    
    @discardableResult func gatherHospital() -> String {
        let hospitalcell = tableview.cellForRow(at: IndexPath(row: 5, section: 0)) as? HospitalTableViewCell
        let hospital = hospitalcell?.hospitalTextfield?.text ?? ""
        return hospital
    }
    
    @discardableResult func gatherDoctor() -> String {
        let doctorcell = tableview.cellForRow(at: IndexPath(row: 6, section: 0)) as? DoctorTableViewCell
        let doctor = doctorcell?.doctorTextfield?.text ?? ""
        return doctor
    }
    
    @discardableResult func gatherBirthdate() -> Date {
        let birthdatecell = tableview.cellForRow(at: IndexPath(row: 7, section: 0)) as? BirthdateTableViewCell
        let birthdate = birthdatecell?.datePicker.date
        return birthdate!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 1:
            let cell = tableview.dequeueReusableCell(withIdentifier: "photocell", for: indexPath)
            if let cell = cell as? PhotoTableViewCell {
                cell.photoImage.image = #imageLiteral(resourceName: "James")
            }
            return cell
        case 2:
            let cell = tableview.dequeueReusableCell(withIdentifier: "nicknamecell", for: indexPath)
            if let cell = cell as? NicknameTableViewCell {
                cell.nicknameTextfield.text = patient?.nickname
            }
            return cell
        case 3:
            let cell = tableview.dequeueReusableCell(withIdentifier: "firstnamecell", for: indexPath)
            if let cell = cell as? FirstnameTableViewCell {
                cell.firstnameTextfield.text = patient?.firstname
            }
            return cell
        case 4:
            let cell = tableview.dequeueReusableCell(withIdentifier: "lastnamecell", for: indexPath)
            if let cell = cell as? LastnameTableViewCell {
                cell.lastnameTextfield.text = patient?.lastname
            }
            return cell
        case 5:
            let cell = tableview.dequeueReusableCell(withIdentifier: "hospitalcell", for: indexPath)
            if let cell = cell as? HospitalTableViewCell {
                cell.hospitalTextfield.text = patient?.hospital
            }
            return cell
        case 6:
            let cell = tableview.dequeueReusableCell(withIdentifier: "doctorcell", for: indexPath)
            if let cell = cell as? DoctorTableViewCell {
                cell.doctorTextfield.text = patient?.doctor
            }
            return cell
        case 7:
            let cell = tableview.dequeueReusableCell(withIdentifier: "birthdatecell", for: indexPath)
            if let cell = cell as? BirthdateTableViewCell {
                cell.datePicker.date = (patient?.birthdate)!
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

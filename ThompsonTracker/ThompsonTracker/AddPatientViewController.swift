//
//  AddPatientViewController.swift
//  ThompsonTracker
//
//  Created by Thunpisit Amnuaikiatloet on 4/27/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit
import Foundation

class AddPatientViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var patient: Patient?
    
    @IBOutlet weak var nicknameTextfield: UITextField!
    @IBOutlet weak var firstnameTextfield: UITextField!
    @IBOutlet weak var lastnameTextfield: UITextField!
    @IBOutlet weak var doctorTextfield: UITextField!
    @IBOutlet weak var hospitalTextfield: UITextField!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var thumbnailPhoto: UIImageView!
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
//        formatter.timeStyle = .short
        formatter.dateStyle = .long
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Add Patient"
        thumbnailPhoto.image = #imageLiteral(resourceName: "DummyPotrait")
        datePicker.datePickerMode = .date
        self.birthdateLabel.text = "Birthdate: " + dateFormatter.string(from: datePicker.date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
        
        dismiss(animated: true)
        
        thumbnailPhoto.image = image
    }
    
    @IBAction func chooseDate(_ sender: Any) {
        birthdateLabel.text = "Birthdate: " + dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        importPicture()
        //imagePickerController(<#T##picker: UIImagePickerController##UIImagePickerController#>, didFinishPickingMediaWithInfo: <#T##[String : Any]#>)
    }
    
    @IBAction func addPatient(_ sender: UIBarButtonItem) {
        
        let nickname = nicknameTextfield.text
        let firstname = firstnameTextfield.text
        let lastname = lastnameTextfield.text
        let birthdate = datePicker.date
        let doctor = doctorTextfield.text
        let hospital = hospitalTextfield.text
        let photo = #imageLiteral(resourceName: "James")
        
        // Where @will create CoreData of Child
        var patient = Patient(nickname: nickname!, firstname: firstname!, lastname: lastname!, birthdate: birthdate, doctor: doctor!, hospital: hospital!, photo: photo)
    }
    
}

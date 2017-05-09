//
//  PatientViewController.swift
//  ThompsonTracker
//
//  Created by Thunpisit Amnuaikiatloet on 4/26/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class PatientViewController: UIViewController {

    var children: [Child]? = Model.sharedInstance.fetchChild()

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
        tableview.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        children?.removeAll()
        children = Model.sharedInstance.fetchChild()
        tableview.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //self.navigationController?.popToRootViewController(animated: <#T##Bool#>)
        
        if let destination = segue.destination as? UITabBarController,
            let indexPath = tableview.indexPathForSelectedRow,
            let finalDestination = (destination.viewControllers?.first as? UINavigationController)?.viewControllers.first as? DashboardViewController {
            
            if let nickName = children?[indexPath.row].nickName{
                finalDestination.patientName = nickName
            }else{
                finalDestination.patientName = children?[indexPath.row].nickName
            }
            
            finalDestination.patientIndex = indexPath.row
        }
    }
}

extension PatientViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return children?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath)
        
        if let cell = cell as? PatientTableViewCell,
            let child = children?[indexPath.row] {
            
            cell.patientNickname.text = child.nickName
            cell.patientFullname.text = child.firstName! + " " + child.lastName!
            cell.patientUpdatedDate.text = dateFormatter.string(from: child.birthDate! as Date)
            cell.patientDoctor.text = child.doctorsName
            
            if let photo = child.photo {
                let photoData = photo as Data
                let image = UIImage(data: photoData)
                cell.patientImage.image = image
                
            }else{
                cell.patientImage.image = #imageLiteral(resourceName: "DummyPotrait")
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { action, index in

            let context = Model.sharedInstance.managedContext
            
            if let childItem = self.children?[index.row]{
                context?.delete(childItem)
            }
            
            self.children?.remove(at: indexPath.row)
            self.tableview.reloadData()
            self.tableview.setEditing(false, animated: true)
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

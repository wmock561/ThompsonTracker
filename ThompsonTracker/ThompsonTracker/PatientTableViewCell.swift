//
//  PatientTableViewCell.swift
//  ThompsonTracker
//
//  Created by Thunpisit Amnuaikiatloet on 4/26/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit
import Foundation

class PatientTableViewCell: UITableViewCell {

    @IBOutlet weak var patientImage: UIImageView!
    @IBOutlet weak var patientNickname: UILabel!
    @IBOutlet weak var patientFullname: UILabel!
    @IBOutlet weak var patientUpdatedDate: UILabel!
    @IBOutlet weak var patientDoctor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        patientNickname.text = nil
        patientFullname.text = nil
        patientUpdatedDate.text = nil
        patientDoctor.text = nil
    }

}

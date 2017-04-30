//
//  LastnameTableViewCell.swift
//  ThompsonTracker
//
//  Created by Thunpisit Amnuaikiatloet on 4/27/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class LastnameTableViewCell: UITableViewCell {

    @IBOutlet weak var lastnameTextfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        lastnameTextfield.text = nil
    }
}

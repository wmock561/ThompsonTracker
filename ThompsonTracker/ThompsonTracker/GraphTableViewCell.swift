//
//  GraphTableViewCell.swift
//  ThompsonTracker
//
//  Created by Ryan Lapeyre on 5/2/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class GraphTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var subView: UIView!
    let dateFormatter = DateFormatter()
    var graph = GraphView()
    var realData = [Dictionary <String, Any>]()
    let x: CGFloat = 10
    let y: CGFloat = 50
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

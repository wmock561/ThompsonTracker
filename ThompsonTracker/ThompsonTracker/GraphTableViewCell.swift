//
//  GraphTableViewCell.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/4/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import UIKit

class GraphTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var drawingView: DrawingView!
    @IBOutlet weak var averageValue: UILabel!
    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var graphTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        
        for view in graphView.subviews{
            view.removeFromSuperview()
        }
        
    }

}

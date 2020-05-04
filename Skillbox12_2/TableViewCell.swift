//
//  TableViewCell.swift
//  Skillbox12_2
//
//  Created by Александр Сорока on 10.04.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var hour1Label: UILabel!
    @IBOutlet weak var hour1temp: UILabel!
    
    @IBOutlet weak var hour2Label: UILabel!
    @IBOutlet weak var hour2Temp: UILabel!
    
    
    @IBOutlet weak var hour3Label: UILabel!
    @IBOutlet weak var hour3Temp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  StoreTableViewCell.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/13/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeAddressLabel: UILabel!
    
    @IBOutlet weak var countyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

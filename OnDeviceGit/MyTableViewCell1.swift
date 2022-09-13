//
//  MyTableViewCell1.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 13/09/22.
//

import UIKit

class MyTableViewCell1: UITableViewCell {
    
    
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var title1: UILabel!
    
    @IBOutlet weak var title2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

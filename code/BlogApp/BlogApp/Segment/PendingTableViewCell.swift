//
//  PendingTableViewCell.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-21.
//

import UIKit

class PendingTableViewCell: UITableViewCell {

    @IBOutlet var pimage: UIImageView!
    @IBOutlet var ptitle: UILabel!
    @IBOutlet var pduration: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

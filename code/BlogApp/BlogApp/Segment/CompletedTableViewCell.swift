//
//  CompletedTableViewCell.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-22.
//

import UIKit

class CompletedTableViewCell: UITableViewCell {


    @IBOutlet var cimage: UIImageView!
    @IBOutlet var ctitle: UILabel!
    @IBOutlet var cduration: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

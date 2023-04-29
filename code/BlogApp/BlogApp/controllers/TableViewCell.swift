//
//  TableViewCell.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-19.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    var data = [ImageEntity]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

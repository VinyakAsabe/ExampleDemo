//
//  TableViewCell.swift
//  TableViewFiBankExample
//
//  Created by Apple on 03/07/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var textDataLabel:UILabel!
    @IBOutlet var textdetailLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

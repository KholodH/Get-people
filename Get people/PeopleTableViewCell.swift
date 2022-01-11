//
//  PeopleTableViewCell.swift
//  Get people
//
//  Created by administrator on 11/01/2022.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var secondL: UILabel!
    @IBOutlet weak var thirdL: UILabel!
    @IBOutlet weak var fourthL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

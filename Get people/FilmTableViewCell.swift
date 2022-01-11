//
//  FilmTableViewCell.swift
//  Get people
//
//  Created by administrator on 11/01/2022.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dirLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var exLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  UserViewCell.swift
//  presteasymo
//
//  Created by Pietro Russo on 07/04/17.
//  Copyright © 2017 Team 2.4. All rights reserved.
//

import UIKit

class UserViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var name_surname: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var stars: UIImageView!
    
    

}

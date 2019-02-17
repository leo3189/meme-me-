//
//  MemeTVCell.swift
//  Meme Me
//
//  Created by leo on 2/17/19.
//  Copyright © 2019 leonard. All rights reserved.
//

import UIKit

class MemeTVCell: UITableViewCell {

    @IBOutlet weak var memedImage: UIImageView!
    @IBOutlet weak var memeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

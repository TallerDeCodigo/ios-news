//
//  FeedTableViewCell.swift
//  appnews
//
//  Created by leopardx on 10/3/16.
//  Copyright © 2016 Taller de Código. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var txtContent: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

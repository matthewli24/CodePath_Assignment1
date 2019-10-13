//
//  MovieTableViewCell.swift
//  assignment1
//
//  Created by Super MattMatt on 10/13/19.
//  Copyright © 2019 assignment1. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // Mark - Props
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

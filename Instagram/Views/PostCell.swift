//
//  PostCell.swift
//  Instagram
//
//  Created by Omar Valenzuela on 8/23/18.
//  Copyright © 2018 Omar Valenzuela. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var upperUsernameLabel: UILabel!
    @IBOutlet weak var lowerUsernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.layer.frame.height / 2
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

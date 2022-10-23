//
//  PhotoTableViewCell.swift
//  FlickrClientApp
//
//  Created by Cihat Salik on 20.10.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

  @IBOutlet var ownerImageView: UIImageView!
  @IBOutlet var ownerNameLabel: UILabel!
  @IBOutlet var photoImageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

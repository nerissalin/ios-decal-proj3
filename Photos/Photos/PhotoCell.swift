//
//  PhotoCell.swift
//  Photos
//
//  Created by Everest Shi on 4/13/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var usernameLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        usernameLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
        photoImageView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        photoImageView.layer.borderWidth = 0.5
        
    }
    
}
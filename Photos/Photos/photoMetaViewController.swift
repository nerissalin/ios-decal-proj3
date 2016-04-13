//
//  photoMetaViewController.swift
//  Photos
//
//  Created by Everest Shi on 4/13/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class photoMetaViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var user: UILabel!
    @IBOutlet var likes: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    
    var displayedPhoto: Photo?
    
   
    
    override func viewDidLoad(){
        let url = NSURL(string: displayedPhoto!.url)
        let photodata = NSData(contentsOfURL: url!)
        image.image = UIImage(data: photodata!)
        user.text = displayedPhoto!.username
        likeButton.addTarget(self, action: "ILikeIt", forControlEvents: .TouchUpInside)
        if displayedPhoto!.liked{
            likeButton.setImage(UIImage(named: "filledHeart.jpg"), forState: .Normal)
            likes.text = String(displayedPhoto!.likes + 1)
        } else {
            likeButton.setImage(UIImage(named: "emptyHeart.jpg"), forState: .Normal)
            likes.text = String(displayedPhoto!.likes)
        }
        let dateString = String(NSDate(timeIntervalSince1970: Double(displayedPhoto!.date!)!))
        dateLabel.text = dateString
    }
    
    func ILikeIt() {
        if displayedPhoto!.liked {
            displayedPhoto!.liked = false
            likes.text = String(displayedPhoto!.likes)
            likeButton.setImage(UIImage(named: "emptyHeart.jpg"), forState: .Normal)
            
        } else {
            displayedPhoto!.liked = true
            likeButton.setImage(UIImage(named: "filledHeart.jpg"), forState: .Normal)
            likes.text = String(displayedPhoto!.likes + 1)
        }
    }
}
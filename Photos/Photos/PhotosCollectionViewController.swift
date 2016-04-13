//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    @IBAction func unwindToPhotoCollectionView(segue: UIStoryboardSegue) {}
    
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionView!.delegate = self
        //collectionView!.dataSource = self
        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell
        
        let photo = photos[indexPath.row]
        cell.usernameLabel.text = photo.username
        let url = NSURL(string: photo.thumbnail)
        cell.photoImageView.image = UIImage(data: NSData(contentsOfURL: url!)!)
        return cell

    }
    
    override func collectionView(collectionView:UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (photos == nil){
            return 0
        }
        return photos.count
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if (photos == nil){
            return 1
        }
        return 1
    }
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.thumbnail)!
        imageView.image = UIImage(data: NSData(contentsOfURL: url)!)
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let preparingForView = segue.destinationViewController as! photoMetaViewController
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView!.indexPathForCell(cell)
        preparingForView.displayedPhoto = photos[indexPath!.row]
    }
    
    
}


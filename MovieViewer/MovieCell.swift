//
//  MovieCell.swift
//  MovieViewer
//
//  Created by XXY on 16/1/24.
//  Copyright © 2016年 XXY. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func viewDidLoad() {
        
        let imageUrl = "https://i.imgur.com/tGbaZCY.jpg"
        let imageRequest = NSURLRequest(URL: NSURL(string: imageUrl)!)
        
        self.posterView.setImageWithURLRequest(
            imageRequest,
            placeholderImage: nil,
            success: { (imageRequest, imageResponse, image) -> Void in
                
                // imageResponse will be nil if the image is cached
                if imageResponse != nil {
                    print("Image was NOT cached, fade in image")
                    self.posterView.alpha = 0.0
                    self.posterView.image = image
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.posterView.alpha = 1.0
                    })
                } else {
                    print("Image was cached so just update the image")
                    self.posterView.image = image
                }
            },
            failure: { (imageRequest, imageResponse, error) -> Void in
                // do something for the failure condition
        })
    }
   
}

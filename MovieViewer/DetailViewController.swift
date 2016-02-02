//
//  DetailViewController.swift
//  MovieViewer
//
//  Created by XXY on 16/1/31.
//  Copyright © 2016年 XXY. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var infoView: UIView!
    
    var movie: NSDictionary!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // scrollView content size:
        // height is the y we just set.
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        let title = movie["title"] as?String
        titleLabel.text = title
        
        let overview = movie["overview"] as?String
        overviewLabel.text = overview
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        
        
        if let posterPath = movie["poster_path"] as? String{
            let posterUrl = NSURL(string: baseUrl + posterPath)
            let imageUrl = NSURL(string:baseUrl + posterPath)
            posterImageView.setImageWithURL(imageUrl!)
        }
        
        

        print(movie)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

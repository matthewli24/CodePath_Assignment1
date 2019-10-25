//
//  MoviesDetailsViewController.swift
//  assignment1
//
//  Created by Super MattMatt on 10/24/19.
//  Copyright © 2019 assignment1. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesDetailsViewController: UIViewController {
    // MARK: - Props
    
    var movie: [String:Any]!
    
    @IBOutlet weak var backDropImage: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text = movie["title"] as? String
        movieTitle.sizeToFit()
        movieOverview.text = movie["overview"] as? String
        movieOverview.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl+posterPath)
        
        posterView.af_setImage(withURL: posterUrl!)
        
        let backDropBaseUrl = "https://image.tmdb.org/t/p/w780"
        let backDropPath = movie["backdrop_path"] as! String
        let backDropUrl = URL(string: backDropBaseUrl+backDropPath)
        
        backDropImage.af_setImage(withURL: backDropUrl!)
    }
    


}

//
//  SuperHeroMovieDetailViewController.swift
//  assignment1
//
//  Created by Super MattMatt on 10/25/19.
//  Copyright © 2019 assignment1. All rights reserved.
//

import UIKit
import AlamofireImage

class SuperHeroMovieDetailViewController: UIViewController {
    
    // MARK: - Props
    var movie: [String:Any]!
    
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitleLabel.text = movie["title"] as? String
        movieTitleLabel.sizeToFit()
        movieOverviewLabel.text = movie["overview"] as? String
        movieOverviewLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl+posterPath)
        posterImageView.af_setImage(withURL: posterUrl!)
        
        let backDropBaseUrl = "https://image.tmdb.org/t/p/w780"
        let backDropPath = movie["backdrop_path"] as! String
        let backDropUrl = URL(string: backDropBaseUrl+backDropPath)
        backDropImageView.af_setImage(withURL: backDropUrl!)

    }
    
    @IBAction func posterTapped(_ sender: Any) {
        performSegue(withIdentifier: "SuperHeroMovieTrailer", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SuperHeroMovieTrailer" {
            let superHeroTrailerVC = segue.destination as! SuperHeroTrailerViewController
            superHeroTrailerVC.movieId = movie["id"] as! Int
        }
    }
    
    

}

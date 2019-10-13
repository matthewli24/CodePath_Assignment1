//
//  FlixViewController.swift
//  assignment1
//
//  Created by Super MattMatt on 10/13/19.
//  Copyright © 2019 assignment1. All rights reserved.
//

import UIKit
import AlamofireImage

class FlixViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    // MARK: - Props
    var movies: [[String: Any]] = []
    @IBOutlet var flixTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flixTableView.dataSource = self
        flixTableView.delegate = self
        retrieveMovies()
    }
    
    
    // MARK: - Private Functions
    
    private func retrieveMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            }
           
            else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //print(dataDictionary["results"]!)
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // Have to cast it as an array of dictionaries
                self.movies = dataDictionary["results"] as! [[String: Any]]

                
                // TODO: Reload your table view data
                self.flixTableView.reloadData()

            }
        }
        task.resume()
        
    }
    
    // MARK: - UITableViewDataSource Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl+posterPath)
        
        cell.movieTitle.text = title
        cell.movieOverview.text = overview
        cell.movieImage.af_setImage(withURL: posterUrl!)
        
        return cell
    }
      
}

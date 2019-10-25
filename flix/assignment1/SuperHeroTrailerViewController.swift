//
//  SuperHeroTrailerViewController.swift
//  assignment1
//
//  Created by Super MattMatt on 10/25/19.
//  Copyright © 2019 assignment1. All rights reserved.
//

import UIKit
import WebKit

class SuperHeroTrailerViewController: UIViewController, WKUIDelegate {
    // MARK: - Props
    var movieId: Int = 0
    var youTubeVideos: [[String:Any]] = []
    var key: String = ""

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveMovieTrailers()
    }
    
    
    private func retrieveMovieTrailers() {
        
        let url = URL(string:"https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            }

            else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.youTubeVideos = dataDictionary["results"] as! [[String: Any]]
                
                for video in self.youTubeVideos {
                    let site = video["site"] as! String
                    if site == "YouTube" {
                        self.key = video["key"] as! String
                        break
                    }
                }
                
                let myURL = URL(string:"https://www.youtube.com/watch?v=\(self.key)")
                let myRequest = URLRequest(url: myURL!)
                self.webView.load(myRequest)
                
            }
        }
        task.resume()

    }

}

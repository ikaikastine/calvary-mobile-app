//
//  SecondViewController.swift
//  Calvary Chapel - Bulletin
//
//  Created by Kevin Stine on 1/11/17.
//  Copyright © 2017 Capstone Group 62. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate {

    
    
    @IBOutlet weak var bulletinWeb: UIWebView!
    
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bulletinWeb.delegate = self
        bulletinWeb.scrollView.delegate = self
        
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        restapisample()
        
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (scrollView.contentOffset.y < 0 ) {
            bulletinWeb.reload()
            restapisample()
            
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        switch navigationType {
        case .linkClicked:
            guard let url = request.url else { return true }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            return false
        default:
            return true
        }
    }

    
    func restapisample() {
        // Set up URL request
        let bulletinPage: String = "https://calvarycorvallis.org/wp-json/wp/v2/pages/1038"
        guard let url = URL(string: bulletinPage) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /pages/1038")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let bulletin = try JSONSerialization.jsonObject(with: responseData, options: [])
                as? [String: AnyObject] else {
                        print("error trying to convert data to JSON")
                        return
                }
                
                guard let bulletinContent = bulletin["content"]?["rendered"] as? String else {
                    print("Could not get bulletin content from JSON")
                    return
                }
                

                //let htmlCode  = "<!DOCTYPE HTML><html><head><link rel='stylesheet' type='text/css' href='/Users/Courtney/Documents/Capstone/Github/iOS/Calvary Chapel/Calvary Chapel/calvarystyle.css'></head><body>" + bulletinContent + "</body></html>"
                
                
                let htmlCode = "<!DOCTYPE HTML><html><head><style> body {color: #5b5e5e; font-family: 'Lora', Palatino;} a { border-bottom: 1px solid #fbaf17; color: #fbaf17; text-decoration: none; } .staff a { border-bottom: 0px none; } a:focus, a:hover { border-bottom: 1px solid #fbaf17; color: #b17b0e; }</style></head><body>" + bulletinContent + "</body></html>"
                
                self.bulletinWeb.loadHTMLString(htmlCode, baseURL: nil)
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
    
  /*  func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
*/
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


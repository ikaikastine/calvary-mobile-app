//
//  FourthViewController.swift
//  Calvary Chapel - Donations
//
//  Created by Kevin Stine on 1/11/17.
//  Copyright © 2017 Capstone Group 62. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet var donateView: UIWebView!
    
    
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        let donateURL = URL (string: "https://www.calvarycorvallis.org/give/")
        
    
        let requestObj = URLRequest(url: donateURL!)

        donateView.loadRequest(requestObj)
        
        donateView.delegate = self
        
        donateView.scrollView.delegate = self
        
        donateView.scrollView.isScrollEnabled = false
    }
    

    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.donateView.stringByEvaluatingJavaScript(from: "document.getElementsByClassName('site-header')[0].style.display='none';" + "document.getElementsByClassName('footer-widgets')[0].style.display='none';" + "document.getElementsByClassName('content')[0].style.display='none';")
        
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


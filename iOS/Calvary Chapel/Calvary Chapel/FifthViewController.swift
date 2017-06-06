//
//  FifthViewController.swift
//  Calvary Chapel - Messages
//
//  Created by Kevin Stine on 1/11/17.
//  Copyright © 2017 Capstone Group 62. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    @IBOutlet var videoViewer: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let youtubeURL = "https://livestream.com/accounts/18343788/events/6975672/videos/148653091/player?width=960&height=540&enableInfo=true&defaultDrawer=&autoPlay=true&mute=false"
        
        videoViewer.allowsInlineMediaPlayback = true
        videoViewer.scalesPageToFit = true
        
        videoViewer.loadHTMLString("<iframe width= \"960\" height= \"540\" src=\(youtubeURL)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
    }


    
    @IBAction func pastSermons(_ sender: Any) {
        
        if let url = URL(string:"https://livestream.com/calvarycorvallis"){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)}
        
    }
    
        
    }



   // override func didReceiveMemoryWarning() {
     //   super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   // }
    
    




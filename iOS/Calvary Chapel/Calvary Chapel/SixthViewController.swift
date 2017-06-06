//
//  SixthViewController.swift
//  Calvary Chapel
//
//  Created by Maxwell Dimm on 2/27/17.
//  Copyright © 2017 Capstone Group 62. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {
    
   
    
    
    @IBOutlet var LastWeek: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let youtubeURL = "https://livestream.com/accounts/18343788/events/6975672/videos/148653091/player?width=640&height=360&enableInfo=true&defaultDrawer=&autoPlay=true&mute=false"
        
        LastWeek.allowsInlineMediaPlayback = true
        
        LastWeek.loadHTMLString("<iframe width=\(LastWeek.frame.width)\" height=\"\(LastWeek.frame.height)\" src=\"\(youtubeURL)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
    }

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  EventDetailViewController.swift
//  Calvary Chapel
//
//  Created by Kevin Stine on 4/27/17.
//  Copyright © 2017 Capstone Group 62. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    // Labels
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventStartLabel: UILabel!
    @IBOutlet weak var eventEndLabel: UILabel!
    @IBOutlet weak var eventGroupLabel: UILabel!
    @IBOutlet weak var leaderNameLabel: UILabel!
    @IBOutlet weak var leaderEmailLabel: UILabel!
    @IBOutlet weak var leaderPhoneLabel: UILabel!
    
    // Data Passed
    var destinationEvent = Event()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        eventNameLabel.text = destinationEvent.name!
        eventDateLabel.text = destinationEvent.month! + " " + destinationEvent.date!
        eventStartLabel.text = destinationEvent.startTime!
        eventEndLabel.text = destinationEvent.endTime!
        eventGroupLabel.text = destinationEvent.groupName!
        leaderNameLabel.text = destinationEvent.leaderName!
        leaderEmailLabel.text = destinationEvent.leaderEmail!
        leaderPhoneLabel.text = destinationEvent.leaderPhone!
        eventLocationLabel.text = destinationEvent.location!
        

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

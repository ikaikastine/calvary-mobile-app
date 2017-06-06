//
//  EventsTableViewCell.swift
//  Calvary Chapel
//
//  Created by Kevin Stine on 1/31/17.
//  Copyright © 2017 Capstone Group 62. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell, XMLParserDelegate {
    
    //MARK: Properties
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    var strXMLData:String = ""
    var currentElement:String = ""
    var passData:Bool=false
    var passName:Bool=false
    var parser = XMLParser()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}

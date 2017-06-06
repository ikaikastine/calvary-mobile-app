//: Playground - noun: a place where people can play

import UIKit



/// Setup the username, password and base URL for connecting to CCB

let userName = "bonnc@oregonstate.edu"
let password = "bonnc123"
let baseURL = "https://calvarycorvallis.ccbchurch.com/api.php?srv=public_calendar_listing&date_start="

let dateFormatter = DateFormatter()
let date = NSDate()

// Specify the format for the date since CCB excepts the date as yyyy-MM-dd

dateFormatter.locale = Locale(identifier: "en_US")
dateFormatter.dateFormat = "yyyy-MM-dd"

print(dateFormatter.string(from: date as Date))

let formattedDate = dateFormatter.string(from: date as Date)

// Append the formatted date to the base URL to have the full URL to connect to CCB

let fullURL = baseURL+formattedDate

let urlToSend = NSURL(string: fullURL)
let request = NSMutableURLRequest(url: urlToSend! as URL)

let config = URLSessionConfiguration.default

let userPasswordString = "\(userName):\(password)"
let userPasswordData = userPasswordString.data(using: String.Encoding.utf8)


var strXMLData:String = ""
var currentElement:String = ""
var passData:Bool=false
var passName:Bool=false
var parser = XMLParser()

let task = URLSession.shared.dataTask(with: urlToSend as! URL) { data, response, error in
    
    if error != nil {
        print(error!)
        return
    }
    
    parser = XMLParser(contentsOf: urlToSend as! URL)!
    
    let success:Bool = parser.parse()
    
    if success {
        print("parse success!")
        
        print(strXMLData)
        
    } else {
        print("parse failure!")
    }
}
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElement=elementName;
        if(elementName=="id" || elementName=="event_name" || elementName=="cost" || elementName=="description")
        {
            if(elementName=="event_name"){
                passName=true;
            }
            passData=true;
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElement="";
        if(elementName=="id" || elementName=="event_name" || elementName=="cost" || elementName=="description")
        {
            if(elementName=="event_name"){
                passName=false;
            }
            passData=false;
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if(passName){
            strXMLData=strXMLData+"\n\n"+string
        }
        
        if(passData)
        {
            print(string)
        }
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("failure error: ", parseError)
    }
    
    
    
    

task.resume()

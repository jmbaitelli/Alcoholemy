//
//  JSonConverter.swift
//  Alcoholemy
//
//  Created by Maria Carolina Santos on 23/07/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import Foundation

class JSonConverter {
    
    init() {
        
    }
    
    // transformando em string no padrão json
    private func JSONStringify(value: AnyObject, prettyPrinted: Bool = false) -> String {
        var options = prettyPrinted ? NSJSONWritingOptions.PrettyPrinted : nil
        if NSJSONSerialization.isValidJSONObject(value) {
            if let data = NSJSONSerialization.dataWithJSONObject(value, options: options, error: nil) {
                if let string = NSString(data: data, encoding: NSUTF8StringEncoding) {
                    return string as String
                }
            }
        }
        return ""
    }
    
    // de padrão json para array de any object
    private func JSONParseArray(jsonString: String) -> [AnyObject] {
        if let data = jsonString.dataUsingEncoding(NSUTF8StringEncoding) {
            if let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil) as? [AnyObject] {
                return array
            }
        }
        return [AnyObject]()
    }
    
    // método
    func stringfyEvents (events: [Events]) -> String {
        var jsonObject: [AnyObject] = []
        
        for event in events {
            
            /***CONVERT FROM NSDate to String ****/
            let start = event.start
            let finish = event.finish
            
            //format date
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "hh:mm" //format style. Browse online to get a format that fits your needs.
            var startString = dateFormatter.stringFromDate(start)
            var finishString = dateFormatter.stringFromDate(finish)
            
            var drinks:[AnyObject] = [AnyObject]()
            
            for alcohol in event.drink {
                let drink = ["drink": alcohol]
                drinks.append(drink)
            }
            
            let party = ["name": event.name, "start": start, "finish": finish, "mood": event.mood, "drink": drinks]
            
            jsonObject.append(party)
        }
        
        let stringJson = JSONStringify(jsonObject)
        
        return stringJson
    }
    

    func convertJSonToArray (stringJson: String) -> [Events] {

        var events = [Events]()
        let array = JSONParseArray(stringJson)
        
        for event:AnyObject in array {
            var name = event["name"] as! String
            var start = event["start"] as! NSDate
            var finish = event["finish"] as! NSDate
            var mood = event["mood"] as! String
            var drink = event["drink"] as! [String]
        
            var newEvent = Events(name: name, start: start, finish: finish, mood: mood, drink: drink)
            
            events.append(newEvent)
        }
        
        return events
    }
}
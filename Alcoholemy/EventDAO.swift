//
//  EventDAO.swift
//  Alcoholemy
//
//  Created by Maria Carolina Santos on 23/07/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import Foundation

class EventDAO {
    
    class func saveNewEvent(jsonString:String) {
        let path = getPath()
        var dict: NSMutableDictionary = ["events": jsonString]
        //saving values
        dict.setObject(jsonString, forKey: "events")
        dict.writeToFile(path, atomically: true)
    }
    
    class func loadScheduleData() -> String{
       
        let path = getPath()
        let fileManager = NSFileManager.defaultManager()
        //check if file exists
        if(!fileManager.fileExistsAtPath(path)) {
            // If it doesn't, copy it from the default file in the Bundle
            if let bundlePath = NSBundle.mainBundle().pathForResource("festa", ofType: "plist") {
                let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
                fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
            }
        }
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        
        var myDict = NSDictionary(contentsOfFile: path)
        if let dict = myDict {
            var savedEvents: AnyObject? = dict["events"]
            if savedEvents?.description != nil{
                return savedEvents!.description
            }
        } else {
            println("WARNING: Couldn't create dictionary from festa.plist! Default values will be used!")
        }
        return ""
    }
    
    private class func getPath() -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("festa.plist")
        return path
    }
    
}


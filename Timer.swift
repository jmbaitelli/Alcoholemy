//
//  Timer.swift
//  Alcoholemy
//
//  Created by Vinícius Arcoverde on 7/23/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class Timer: NSObject {
    
    var time = 5
    
    func startTimer() {
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("Notification"), userInfo: nil, repeats: true)
    }
    
    func Notification(){
        let randomNumber = Int(arc4random_uniform(5))
        
        time -= 1
        
        if(time == 0) {
            
            var notification = UILocalNotification()
            
            notification.alertAction = "go back to app"
            //        notification.alertBody = "You're drunk. Go home!!" /* This should be changing */
            notification.alertBody = NotificationModel.sharedinstance.advices[randomNumber]
            notification.fireDate = NSDate (timeIntervalSinceNow: 0)
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
            //        timer.invalidate()
            
            time = 5
        }
    }



}

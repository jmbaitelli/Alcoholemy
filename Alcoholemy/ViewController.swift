//
//  ViewController.swift
//  Alcoholemy
//
//  Created by Julia Motta Baitelli on 20/07/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 10
    var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: ("Notification"), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func Notification(){
        time -= 1
        
        if(time == 0) {
        
        var notification = UILocalNotification()
        
        notification.alertAction = "go back to app"
        notification.alertBody = "You're drunk. Go home!!" /* This should be changing */
        notification.fireDate = NSDate (timeIntervalSinceNow: 0)
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        timer.invalidate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


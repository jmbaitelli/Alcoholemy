//
//  ViewController.swift
//  Alcoholemy
//
//  Created by Julia Motta Baitelli on 20/07/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        timer.startTimer()

//        var vc = (nibName: "DataView.xib", bundle: nil)
        
        self.presentViewController(vc, animated: false, completion: nil)
        // Do any additional setup after loading the view, typically from a nib.
    
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


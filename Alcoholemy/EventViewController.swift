//
//  TipViewController.swift
//  Alcoholemy
//
//  Created by Maria Carolina Santos on 22/07/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Novo Evento"
        
        var title: UILabel = UILabel()
        title.frame = CGRectMake(20, 100, 100, 50)
        title.textAlignment = NSTextAlignment.Center
        title.text = "Novo Evento"
        self.view.addSubview(title)
        
        var txtField: UITextField = UITextField()
        txtField.frame = CGRectMake(120, 100, 200, 50)
        txtField.borderStyle = UITextBorderStyle.RoundedRect
        txtField.text = "nome"
        txtField.clearsOnInsertion = true
//        txtField.keyboardType = .NumberPad
        self.view.addSubview(txtField)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

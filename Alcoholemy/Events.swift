//
//  Eventos.swift
//  Alcoholemy
//
//  Created by Maria Carolina Santos on 23/07/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import Foundation

class Events {

    var name: String
    var start: NSDate
    var finish: NSDate
    var mood: String
    var drink:[String]
    
    
    init (name: String, start: NSDate, finish: NSDate, mood: String, drink: [String]){
        
        self.name = name
        self.start = start
        self.finish = finish
        self.mood = mood
        self.drink = drink
        
    }
    
}

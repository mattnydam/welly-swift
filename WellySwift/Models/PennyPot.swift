//
//  PennyPot.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

class PennyPot: NSObject {

    let title:String = "";
    let goal:Int = 0;
    let progress:Int = 0;
    
    init(title:String, goal:Int) {
        self.title = title;
        self.goal = goal;
    }

    func formattedProgress() -> String {
        
        return "$" + String(progress) + " of $" + String(goal);
    }
}

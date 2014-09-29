//
//  DataManager.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    var pennyPots:Array<PennyPot>? = Array<PennyPot>()
    
    private let pennyOne:PennyPot = PennyPot(title: "New York", goal: 5000)
    private let pennyTwo:PennyPot = PennyPot(title: "Guitar", goal: 200)
    private let pennyThree:PennyPot = PennyPot(title: "Ski trip", goal: 1200)
    private let pennyFour:PennyPot = PennyPot(title: "Playstation 4", goal: 640)
    private let pennyFive:PennyPot = PennyPot(title: "China trip", goal: 8000)
    private let pennySix:PennyPot = PennyPot(title: "New Car", goal: 2500)
    
    override init() {
        super.init()
        self.pennyOne.progress = 3000;
        self.pennyTwo.progress = 146;
        self.pennyThree.progress = 1;
        self.pennyFour.progress = 0;
        self.pennyFive.progress = 9000;
        self.pennySix.progress = 1200;
        self.pennyPots = [self.pennyOne, self.pennyTwo, self.pennyThree, self.pennyFour, self.pennyFive, self.pennySix];
    }
    
}

//
//  DataManager.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    let userDefaultsKey:String! = "storedSavingsTargetArray"
    
    var allSavingsTargets:Array<SavingsTarget>! = Array<SavingsTarget>()
    
    class var sharedInstance : DataManager {
        struct Static {
            static let instance : DataManager = DataManager()
        }
        return Static.instance
    }
    
    override init() {
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        super.init()
    }
    
    // MARK - Add, Remove, Retrieve, Replace
    
    func addSavingsTarget(savingsTargetToAdd: SavingsTarget?) {
        if ((savingsTargetToAdd) != nil) {
            allSavingsTargets?.append(savingsTargetToAdd!)
        }
        saveCurrentObjectArrayToDefaults()
    }
    
    func replaceSavingsTargetAtPosition(position: Int!, objectToAdd: SavingsTarget) {
        allSavingsTargets[position] = objectToAdd
        saveCurrentObjectArrayToDefaults()
    }
    
    func removeSavingsTargetAtPosition(position: Int!) {
        allSavingsTargets.removeAtIndex(position)
        saveCurrentObjectArrayToDefaults()
    }
    
    func savingsTargetAtPosition(position : Int!) -> SavingsTarget {
        var target:SavingsTarget! = allSavingsTargets[position]
        return target;
    }
    
    // MARK - Saving Loading
    
    func saveCurrentObjectArrayToDefaults() {
        
    }
    
}

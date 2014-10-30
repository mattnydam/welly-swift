//
//  DataManager.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    
    var allSavingsTargets:Array<SavingsTarget>! = Array<SavingsTarget>()
    
    class var sharedInstance : DataManager {
        struct Static {
            static let instance : DataManager = DataManager()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
        var targetOne:SavingsTarget = SavingsTarget(title: "New York Trip", goal: 9000)
        targetOne.progress = 5000
        var targetTwo:SavingsTarget = SavingsTarget(title: "Ski Trip", goal: 1000)
        targetTwo.progress = 430
        
        allSavingsTargets.append(targetOne)
        allSavingsTargets.append(targetTwo)
    }
    
    // MARK - Add, Remove, Retrieve, Replace
    
    func addSavingsTarget(savingsTargetToAdd: SavingsTarget?) {
        if ((savingsTargetToAdd) != nil) {
            allSavingsTargets?.append(savingsTargetToAdd!)
        }
    }
    
    func updateOrInsertSavingsTarget(objectToAdd: SavingsTarget) {
        
        for (var index:Int = 0; index < allSavingsTargets.count; index++) {
            var target = allSavingsTargets[index]
           
            if  (target == objectToAdd) {
                allSavingsTargets[index] = target
                return
            }
            
        }
        // If it doesn't exist, let's add it.
        addSavingsTarget(objectToAdd)
    }
    
    func removeSavingsTargetAtPosition(position: Int!) {
        allSavingsTargets.removeAtIndex(position)
    }
    
    func savingsTargetAtPosition(position : Int!) -> SavingsTarget {
        var target:SavingsTarget! = allSavingsTargets[position]
        return target;
    }
    
}

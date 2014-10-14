//
//  DataManager.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    let userDefaultsKey:String! = "storedPennyArray"
    
    var pennyPots:Array<PennyPot>! = Array<PennyPot>()
    
    class var sharedInstance : DataManager {
        struct Static {
            static let instance : DataManager = DataManager()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        // Pull our current object array out.
        var pennyObjectArray:[NSArray]? = defaults.objectForKey(userDefaultsKey) as? [NSArray]
        
        if (pennyObjectArray == nil) { // This hasn't been created yet, soo let's do it!
            saveCurrentObjectArrayToDefaults()
        } else {

        }
        
    }
    
    // MARK - Add, Remove, Retrieve, Replace
    
    func addPennyPot(potToAdd: PennyPot?) {
        if ((potToAdd) != nil) {
            pennyPots?.append(potToAdd!)
        }
        saveCurrentObjectArrayToDefaults()
    }
    
    func replacePennyObjectAtIndex(indexToReplace: Int!, objectToAdd: PennyPot) {
        pennyPots[indexToReplace] = objectToAdd
        saveCurrentObjectArrayToDefaults()
    }
    
    func removePotAtIndex(indexToRemove: Int!) {
        pennyPots.removeAtIndex(indexToRemove)
        saveCurrentObjectArrayToDefaults()
    }
    
    func pennyPotAtIndex(indexToRetrieve : Int!) -> PennyPot {
        var pot:PennyPot! = pennyPots[indexToRetrieve]
        return pot;
    }
    
    // MARK - Saving Loading
    
    func saveCurrentObjectArrayToDefaults() {

//        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        defaults.setObject(pennyPots, forKey: userDefaultsKey)
//        defaults.synchronize()
    }
    
}

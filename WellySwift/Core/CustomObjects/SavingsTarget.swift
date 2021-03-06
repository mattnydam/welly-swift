//
//  SavingsTarget.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

// Woah. Operator override. Cool.
func == (this:SavingsTarget, that: SavingsTarget) -> Bool {
    
    if (this.savingsTargetId == that.savingsTargetId && this.creationDate == that.creationDate) {
        return true
    }
    
    return false
}

class SavingsTarget: NSObject {
    
    // Equality Vars
    let savingsTargetId: Int!
    let creationDate: NSDate!
    
    var goal: Int! = 0
    var progress: Int! = 0
    var title: String! = ""
    
    var currentPercent:CGFloat  {
      
        get {
            
            if((progress > goal) || (goal < 0) || (progress <= 0)) {
                return 0
            }
            let currentPercent = CGFloat((CGFloat(progress)/CGFloat(goal)) * 100.0)
            
            return currentPercent
        }
    }
    
    init(title:String!, goal:Int!) {
        self.title = title
        self.goal = goal
        self.savingsTargetId = Int(arc4random_uniform(3000))
        self.creationDate = NSDate()
        super.init()

        
    }

    func getProgressWidth(maxWidth: CGFloat) -> CGFloat {
        
        if (maxWidth <= 0) {
            return 0.0;
        }
                
        return getWidthPercentage(maxWidth, percent: currentPercent)
    }
    
    func formattedDisplayValue() -> String {
        
        return "$" + String(progress) + " of $" + String(goal);
    }
    
    private func getWidthPercentage(maxWidth:CGFloat, percent:CGFloat) -> CGFloat {

        if (currentPercent <= 0 || maxWidth <= 0) {
            return 0
        }
        
        let percentageFraction = maxWidth * (percent/100.0)
        
        return percentageFraction
    }
}

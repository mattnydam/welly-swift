//
//  AddPotViewController.swift
//  WellySwift
//
//  Created by Matt Nydam on 6/10/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

//protocol AddPotViewControllerProtocol {
//    
//    func addPotViewControllerShouldDismissWithPennyPot(pennyPot: PennyPot);
//}

class AddPotViewController: UIViewController {

    let pennyData:DataManager = DataManager.sharedInstance
//    var delegate:AddPotViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dismissButtonPressed(sender: AnyObject) {
        
        var pot:PennyPot = PennyPot(title: "something great", goal: 9000)
        pennyData.addPennyPot(pot)
        
        dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
//        delegate?.addPotViewControllerShouldDismissWithPennyPot(PennyPot(title: "Yay", goal: 200))
        
    }

}

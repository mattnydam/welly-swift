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

//    var delegate:AddPotViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dismissButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
//        delegate?.addPotViewControllerShouldDismissWithPennyPot(PennyPot(title: "Yay", goal: 200))
        
    }

}

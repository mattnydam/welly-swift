//
//  AddPotViewController.swift
//  WellySwift
//
//  Created by Matt Nydam on 6/10/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

protocol AddPotViewControllerProtocol {
    
    func addPotViewControllerDidDismissWithPennyPot(pennyPot: PennyPot);
}

class AddPotViewController: UIViewController {

    var delegate:AddPotViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dismissButtonPressed(sender: AnyObject) {
        
        if (delegate != nil) {
            delegate?.addPotViewControllerDidDismissWithPennyPot(PennyPot(title: "Yay", goal: 200))
        }
        
        dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
    }

}

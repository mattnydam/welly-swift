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

class AddPotViewController: UIViewController, UITextFieldDelegate {

    var delegate:AddPotViewControllerProtocol?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var currentProgressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let cancelButton:UIBarButtonItem? = sender as? UIBarButtonItem
        
        if ((cancelButton) != nil) {
            println("I was cancelled from the navigation bar")
            return
        }
        
        if (delegate != nil) {
            var pot = PennyPot(title: "Yay", goal: 200)
            pot.progress = 100
            delegate?.addPotViewControllerDidDismissWithPennyPot(pot)
        }
    }
    
    // MARK: - Text field Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == currentProgressTextField) {
            println("Current")
        }
        return true
    }

}

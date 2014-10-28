//
//  AddSavingsTargetViewController.swift
//  WellySwift
//
//  Created by Matt Nydam on 6/10/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

protocol AddSavingsTargetViewControllerProtocol {
    
    func addSavingsTargetViewControllerDidDismissWithSavingsTarget(target: SavingsTarget)
}

class AddSavingsTargetViewController: UIViewController, UITextFieldDelegate {

    var delegate:AddSavingsTargetViewControllerProtocol?
    
    var editableSavingsTarget:SavingsTarget?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var currentProgressTextField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (editableSavingsTarget != nil) {
            nameTextField.text = editableSavingsTarget!.title
            goalTextField.text = String(editableSavingsTarget!.goal)
            currentProgressTextField.text = String(editableSavingsTarget!.progress)
        }

    }
    
    // MARK: - Configuration
    
    func configureFormWithSavingsTarget(target:SavingsTarget, index: Int) {
        editableSavingsTarget = target
        
    }
    
    // MARK: - Text field Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == currentProgressTextField) {
            println("Current")
        }
        return true
    }
    
    // MARK: - Object Creation/Update
    
    func updateSavingsTarget(target:SavingsTarget) {
        target.title = nameTextField.text!
        target.goal = goalTextField.text.toInt()!
        target.progress = currentProgressTextField.text.toInt()!
    }
    
    func createSavingsTargetFromForm() -> SavingsTarget {
        var newTitle = nameTextField.text
        var goal = goalTextField.text.toInt()
        var currentProgress = currentProgressTextField.text.toInt()
        
        var newSavingsTarget:SavingsTarget! = SavingsTarget(title: newTitle, goal: goal)
        newSavingsTarget.progress = currentProgress!
        
        return newSavingsTarget
        
    }
    
    // Make sure all of the fields are there! And that the current progress is less than or equal to the goal
    func allFormFieldsAreValid() -> Bool {
        var newTitle:String? = nameTextField.text
        var goal:Int? = goalTextField.text.toInt()
        var currentProgress:Int? = currentProgressTextField.text.toInt()
        
        if (newTitle != nil && goal != nil && currentProgress != nil && goal <= currentProgress) {
            return true
        } else {
            return false
        }
    }
    
    
    // MARK: - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        view.endEditing(true) // Make sure we hide the keyboard before we dismiss the current view.
        
        let barButton:UIBarButtonItem? = sender as? UIBarButtonItem
        
        if (!allFormFieldsAreValid()) {
            println("Please fill out all the fields and make sure they are valid!")
            return
        }
        
        // Let's send the objects back.
        if (delegate != nil ) {

            if (editableSavingsTarget == nil) {
                editableSavingsTarget = createSavingsTargetFromForm() // Get our new object from our form!
            } else {
                updateSavingsTarget(editableSavingsTarget!)
            }
            
            delegate?.addSavingsTargetViewControllerDidDismissWithSavingsTarget(editableSavingsTarget!)
            
        }
    }

}

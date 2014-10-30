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
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var savingsGoalTextField: UITextField!
    @IBOutlet weak var currentSavingsProgressTextField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (editableSavingsTarget != nil) {
            titleTextField.text = editableSavingsTarget!.title
            savingsGoalTextField.text = String(editableSavingsTarget!.goal)
            currentSavingsProgressTextField.text = String(editableSavingsTarget!.progress)
        }

    }
    
    // MARK: - Configuration
    func configureFormWithSavingsTarget(target:SavingsTarget, index: Int) {
        editableSavingsTarget = target
    }
    
    // MARK: - Text field Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == currentSavingsProgressTextField) {
            println("Current")
        }
        return true
    }
    
    // MARK: - Object Creation/Update
    
    func updateSavingsTarget(target:SavingsTarget) {
        target.title = titleTextField.text!
        target.goal = savingsGoalTextField.text.toInt()!
        target.progress = currentSavingsProgressTextField.text.toInt()!
    }
    
    func createSavingsTargetFromForm() -> SavingsTarget {
        var newTitle = titleTextField.text
        var goal = savingsGoalTextField.text.toInt()
        var currentProgress = currentSavingsProgressTextField.text.toInt()
        
        var newSavingsTarget:SavingsTarget! = SavingsTarget(title: newTitle, goal: goal)
        newSavingsTarget.progress = currentProgress!
        
        return newSavingsTarget
        
    }
    
    // Make sure all of the fields are there! And that the current progress is less than or equal to the goal
    func allFormFieldsAreValid() -> Bool {
        var newTitle:String? = titleTextField.text
        var goal:Int? = savingsGoalTextField.text.toInt()
        var currentProgress:Int? = currentSavingsProgressTextField.text.toInt()
        
        if (newTitle != nil && goal != nil && currentProgress != nil) {
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
        if (editableSavingsTarget == nil) {
            editableSavingsTarget = createSavingsTargetFromForm() // Get our new object from our form!
        } else {
            updateSavingsTarget(editableSavingsTarget!)
        }
        
        delegate?.addSavingsTargetViewControllerDidDismissWithSavingsTarget(editableSavingsTarget!)
        
        
    }

}

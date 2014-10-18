//
//  AddSavingsTargetViewController.swift
//  WellySwift
//
//  Created by Matt Nydam on 6/10/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

protocol AddSavingsTargetViewControllerProtocol {
    
    func addSavingsTargetViewControllerDidDismissWithSavingsTarget(target: SavingsTarget);
    func addSavingsTargetViewControllerDidDismissWithObjectAndPosition(target: SavingsTarget, index: Int)
}

class AddSavingsTargetViewController: UIViewController, UITextFieldDelegate {

    var delegate:AddSavingsTargetViewControllerProtocol?
    
    var shouldEditSavingsTarget = false
    var indexToAdd:Int?
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
        shouldEditSavingsTarget = true
        indexToAdd = index
        
    }
    
    // MARK: - Text field Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == currentProgressTextField) {
            println("Current")
        }
        return true
    }
    
    // MARK: - Object Creation
    
    func createSavingsTargetFromForm() -> SavingsTarget {
        var newTitle = nameTextField.text
        var goal = goalTextField.text.toInt()
        var currentProgress = currentProgressTextField.text.toInt()
        
        var newSavingsTarget:SavingsTarget! = SavingsTarget(title: newTitle, goal: goal)
        newSavingsTarget.progress = currentProgress!
        
        return newSavingsTarget
        
    }
    
    func allFormFieldsAreValid() -> Bool {
        var newTitle:String? = nameTextField.text
        var goal:Int? = goalTextField.text.toInt()
        var currentProgress:Int? = currentProgressTextField.text.toInt()
        
        if (newTitle != nil && goal != nil && currentProgress != nil) {
            return true
        } else {
            return false
        }
    }
    
    
    // MARK: - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        view.endEditing(true) // Make sure we hide the keyboard before we dismiss the current view.
        
        let cancelButton:UIBarButtonItem? = sender as? UIBarButtonItem
        
        if ((cancelButton) != nil) {
            println("I was cancelled from the navigation bar")
            return
        }
        
        if (!allFormFieldsAreValid()) {
            println("Please fill out all the fields and make sure they are valid!") // Extra curricular - Validation
            return
        }
        
        // Let's send the objects back.
        if (delegate != nil ) {

            editableSavingsTarget = createSavingsTargetFromForm() // Get our new object from our form!
            
            if (shouldEditSavingsTarget) { // We got here by tapping on a cell, so we are updating that object, not creating a new one
                
                delegate?.addSavingsTargetViewControllerDidDismissWithObjectAndPosition(editableSavingsTarget!, index: indexToAdd!)
                
            } else { // We got here via the add button. Which means we are creating a new object
                
                delegate?.addSavingsTargetViewControllerDidDismissWithSavingsTarget(editableSavingsTarget!)
                
            }
        }
    }

}

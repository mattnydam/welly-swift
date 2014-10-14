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
    func addPotViewControllerDidDismissWithObjectAndPosition(pennyPot: PennyPot, index: Int)
}

class AddPotViewController: UIViewController, UITextFieldDelegate {

    var delegate:AddPotViewControllerProtocol?
    
    var shouldEditPennyPot = false
    var indexToAdd:Int?
    var editablePennyPot:PennyPot?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var currentProgressTextField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (editablePennyPot != nil) {
            nameTextField.text = editablePennyPot!.title
            goalTextField.text = String(editablePennyPot!.goal)
            currentProgressTextField.text = String(editablePennyPot!.progress)
        }

    }
    
    // MARK: - Configuration
    
    func configureFormWithPennyPotAtIndex(currentPot:PennyPot, index: Int) {
        editablePennyPot = currentPot
        shouldEditPennyPot = true
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
    
    func createPennyPotObjectFromForm() -> PennyPot {
        var newTitle = nameTextField.text
        var goal = goalTextField.text.toInt()
        var currentProgress = currentProgressTextField.text.toInt()
        
        var newPennyPot:PennyPot! = PennyPot(title: newTitle, goal: goal)
        newPennyPot.progress = currentProgress!
        
        return newPennyPot
        
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
            println("Please fill out all the fields and make sure they are valid!")
            return
        }
        
        // Let's send the objects back.
        if (delegate != nil ) {

            editablePennyPot = createPennyPotObjectFromForm() // Get our new object from the form!
            
            if (shouldEditPennyPot) { // We got here by tapping on a cell, so we are updating that object, not creating a new one
                delegate?.addPotViewControllerDidDismissWithObjectAndPosition(editablePennyPot!, index: indexToAdd!)
            } else { // We got here via the add button. Which means we are creating a new object
                delegate?.addPotViewControllerDidDismissWithPennyPot(editablePennyPot!)
            }
        }
    }

}

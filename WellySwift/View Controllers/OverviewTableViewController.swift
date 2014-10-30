//
//  SavingsTargetOverviewTableViewController.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

class OverviewTableViewController: UITableViewController, AddSavingsTargetViewControllerProtocol{
    
    let savingsTargetsData:DataManager! = DataManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return savingsTargetsData.allSavingsTargets.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("overviewTableViewCell", forIndexPath: indexPath) as OverviewTableViewCell
        cell.configureWithSavingsTarget(savingsTargetsData.savingsTargetAtPosition(indexPath.row))
    
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == .Delete) {
            savingsTargetsData.removeSavingsTargetAtPosition(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let savingsTargetToEdit:SavingsTarget! = savingsTargetsData.savingsTargetAtPosition(indexPath.row)
        
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let editSavingsTargetViewController:AddSavingsTargetViewController = mainStoryboard.instantiateViewControllerWithIdentifier("addSavingsTargetViewController")
         as AddSavingsTargetViewController
        
        let editNavigation:UINavigationController = UINavigationController(rootViewController: editSavingsTargetViewController)
        
        editSavingsTargetViewController.delegate = self
        editSavingsTargetViewController.configureFormWithSavingsTarget(savingsTargetToEdit, index: indexPath.row)
        
        // configure
        
        self.presentViewController(editNavigation, animated: true, completion:nil)
        
    }
    
    // MARK: - Add Savings Target view controller delegate
    
    func addSavingsTargetViewControllerDidDismissWithSavingsTarget(target: SavingsTarget) {
        savingsTargetsData.updateOrInsertSavingsTarget(target)
        tableView.reloadData()
    }
    
    // MARK: - Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "addSavingsTargetSegue"{
            let addSavingsViewController = segue.destinationViewController.topViewController as AddSavingsTargetViewController
            addSavingsViewController.delegate = self
        }
    }

    // Unwind from our modal view controller!
    @IBAction func unwindFromAdd(segue: UIStoryboardSegue) {
    }
}

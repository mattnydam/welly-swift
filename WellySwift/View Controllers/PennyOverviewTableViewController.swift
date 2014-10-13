//
//  WSWPennyOverviewTableViewController.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

let cellIdentifier:String = "PennyOverviewCell"

class PennyOverviewTableViewController: UITableViewController, AddPotViewControllerProtocol{
    
    let pennyData:DataManager! = DataManager.sharedInstance
    
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

        return pennyData.pennyPots.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as PennyOverviewTableViewCell
        cell.configureWithPennyPot(pennyData.pennyPotAtIndex(indexPath.row))
        
        cell.selectionStyle = .None
    
        return cell
    }
    
    // MARK: - Add pot view controller
    func addPotViewControllerDidDismissWithPennyPot(pennyPot: PennyPot) {
        pennyData.addPennyPot(pennyPot)
        tableView.reloadData()
    }
    
    // MARK: - Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "presentAddPotViewController"{
            let addPotViewController = segue.destinationViewController as AddPotViewController
            addPotViewController.delegate = self
        }
    }
}

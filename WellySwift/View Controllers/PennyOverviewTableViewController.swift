//
//  WSWPennyOverviewTableViewController.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

let cellIdentifier:String = "PennyOverviewCell"

class PennyOverviewTableViewController: UITableViewController{
    
    var pennyPots:Array<PennyPot>! = Array<PennyPot>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pennyPots = DataManager().pennyPots
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return pennyPots.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as PennyOverviewTableViewCell
        
        cell.configureWithPennyPot(pennyPots[indexPath.row])
        
        cell.selectionStyle = .None
    
        return cell
    }

    // MARK: - Add Pot Delegate
//    
//    func addPotViewControllerShouldDismissWithPennyPot(pennyPot: PennyPot) {
//        navigationController?.dismissViewControllerAnimated(true, completion: { () -> Void in
//            
//        })
//    }

    
}

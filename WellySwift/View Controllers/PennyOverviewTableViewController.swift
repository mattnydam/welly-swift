//
//  WSWPennyOverviewTableViewController.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

let cellIdentifier:String = "PennyOverviewCell"

class PennyOverviewTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Loaded")
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1;
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {

        return 10;
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        cell.selectionStyle = .None
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

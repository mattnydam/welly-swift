//
//  PennyOverviewTableViewCell.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

class PennyOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Round dem corners gurl
        var progressBarHeight = progressBar.frame.size.height;
        progressBar.layer.cornerRadius = progressBarHeight/2;
    }
    
    func configureWithPennyPot(pot: PennyPot) {
        titleLabel.text = pot.title
        valueLabel.text = pot.formattedDisplayValue();

    }

}

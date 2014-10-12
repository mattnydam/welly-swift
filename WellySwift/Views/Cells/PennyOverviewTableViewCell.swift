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
    @IBOutlet weak var currentProgressBar: UIView!
    
    var progressWidth:CGFloat = 0.0
    var pennyPot:PennyPot!
    
    override func awakeFromNib() {

        super.awakeFromNib()

        var progressBarHeight = progressBar.frame.size.height
        currentProgressBar.layer.cornerRadius = progressBarHeight/2
        progressBar.layer.cornerRadius = progressBarHeight/2
    }
    
    func configureWithPennyPot(pot: PennyPot) {
        pennyPot = pot
        titleLabel.text = pennyPot.title
        valueLabel.text = pennyPot.formattedDisplayValue();

        progressBar.setNeedsLayout()
        currentProgressBar.updateConstraints()

    }
    override func layoutSubviews() {
     
        super.layoutSubviews()
    }
    
    override func updateConstraints() {

        var pennyWidth = pennyPot.getProgressWidth(280)
        progressWidth = progressBar.frame.size.width

        println(progressWidth)
        var constraint:NSLayoutConstraint = NSLayoutConstraint(item: currentProgressBar, attribute: .Width, relatedBy: .Equal, toItem:progressBar, attribute: .Width, multiplier: 0, constant: pennyWidth)
        currentProgressBar.addConstraints([constraint])
        
        super.updateConstraints()
    }
}

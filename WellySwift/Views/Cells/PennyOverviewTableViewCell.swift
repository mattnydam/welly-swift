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
    
    var dynamicWidthConstraint:NSLayoutConstraint!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
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

        self.updateConstraints()

    }

    override func prepareForReuse() {
        
        dynamicWidthConstraint = NSLayoutConstraint(item: currentProgressBar, attribute: .Width, relatedBy: .Equal, toItem:progressBar, attribute: .Width, multiplier: 0, constant: 0)

        currentProgressBar.updateConstraints()
        super.prepareForReuse()
    }
    
    override func updateConstraints() {

        var currentWidth = contentView.bounds.size.width - 40 // 40 includes our two edge insets. Let's change
        var pennyWidth = pennyPot.getProgressWidth(currentWidth)
        
        dynamicWidthConstraint = NSLayoutConstraint(item: currentProgressBar, attribute: .Width, relatedBy: .Equal, toItem:progressBar, attribute: .Width, multiplier: 0, constant: pennyWidth)
        currentProgressBar.addConstraints([dynamicWidthConstraint])
        
        super.updateConstraints()
    }
}

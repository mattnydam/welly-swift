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
    
    var pennyPot:PennyPot!
    var progressWidth:CGFloat = 0.0
    
    lazy var currentProgressBar: UIView = {
        return UIView()
    }()
    
    override func awakeFromNib() {

        super.awakeFromNib()
        
        // Round dem corners gurl2
        var progressBarHeight = progressBar.frame.size.height
        progressBar.layer.cornerRadius = progressBarHeight/2
        currentProgressBar.layer.cornerRadius = progressBarHeight/2
        
        currentProgressBar.backgroundColor = UIColor.orangeColor()
        
        self.contentView.addSubview(currentProgressBar)
    }
    
    func configureWithPennyPot(pot: PennyPot) {
        pennyPot = pot
        titleLabel.text = pennyPot.title
        valueLabel.text = pennyPot.formattedDisplayValue();
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if (pennyPot != nil) {
            progressWidth = pennyPot.getProgressWidth(progressBar.bounds.size.width);

        }
        
        var currentProgressFrame = progressBar.frame
        currentProgressFrame.size.width = progressWidth
        
        currentProgressBar.frame = currentProgressFrame
        
    }


}

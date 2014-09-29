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
        titleLabel.text = pot.title
        valueLabel.text = pot.formattedDisplayValue();
        progressWidth = pot.getProgressWidth(320); // Need to dynamically calculate
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var currentProgressFrame = progressBar.frame
        currentProgressFrame.size.width = progressWidth
        
        currentProgressBar.frame = currentProgressFrame
        
    }


}

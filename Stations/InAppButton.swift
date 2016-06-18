//
//  InAppButton.swift
//  Stations
//
//  Created by OldMan on 18/06/16.
//  Copyright © 2016 OldMan. All rights reserved.
//

import UIKit

class InAppButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        rework(backColor: standardButtonColor,
               cornerRadius: 4,
               normalTitleColor: standardButtonTitleColor)
    }
    
    func rework(backColor backColor: UIColor, cornerRadius: CGFloat, normalTitleColor: UIColor) {
        self.backgroundColor = backColor
        self.layer.cornerRadius = cornerRadius
        self.setTitleColor(normalTitleColor, forState: .Normal)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
}

//
//  ShadowView.swift
//  breakpoint
//
//  Created by Landon Carr on 5/1/18.
//  Copyright © 2018 Landon Carr. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    
    
    override func awakeFromNib() {
        
      //  setupView()
        
        
        
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        super.awakeFromNib()
    }
 
}

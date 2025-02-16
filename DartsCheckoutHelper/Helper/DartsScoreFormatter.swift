//
//  DartsScoreFormatter.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 22/01/2025.
//

import Foundation

class DartsScoreFormatter: NumberFormatter {

    override init() {
        super.init()
        self.usesSignificantDigits = true
        self.minimum = 2
        self.maximum = 501
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

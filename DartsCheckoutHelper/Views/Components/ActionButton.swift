//
//  ActionButton.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 14/02/2025.
//

import SwiftUI

struct ActionButton: View {
    
    let buttonTitle: String
    let background: Color
    let action: (() -> Void)

    init(buttonTitle: String, background: Color = .black, action: @escaping () -> Void) {
        self.buttonTitle = buttonTitle
        self.background = background
        self.action = action
    }

    var body: some View {
        Button(buttonTitle) {
            action()
        }
        .foregroundColor(.white)
        .padding()
        .background(background)
        .cornerRadius(8)
    }
}

#Preview {
    ActionButton(buttonTitle: "Checkout", action: { /* No Action */ })
}

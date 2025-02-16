//
//  HeaderView.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 14/02/2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Image(systemName: "circle.circle")
                .resizable()
                .frame(maxWidth: 70, maxHeight: 70)
                .foregroundColor(.red)

            Text("Darts Checkout")
                .font(.title)
                .fontWeight(.semibold)
        }
        .padding()
    }
}

#Preview {
    HeaderView()
}

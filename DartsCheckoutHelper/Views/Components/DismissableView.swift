//
//  DismissableView.swift
//  DartsCheckoutHelper
//
//  Created by Nathan Lawlor on 15/02/2025.
//

import SwiftUI

struct DismissableView<Content: View>: View {

    @ViewBuilder let content: Content
    let dismiss: (() -> Void)

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button("", systemImage: "xmark") {
                        dismiss()
                    }
                    .foregroundStyle(.black)
                    .padding()
                }
                Spacer()
            }
            content
        }
    }
}

#Preview {
    DismissableView() {
        VStack {
            Spacer()
            Text("Content")
            Spacer()
        }
    } dismiss: {
        /* No Action */
    }
}

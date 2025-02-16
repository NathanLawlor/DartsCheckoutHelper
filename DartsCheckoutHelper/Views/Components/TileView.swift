//
//  TileView.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 22/01/2025.
//

import Foundation
import SwiftUI

struct TileView: View {
    @State private var backgroundColour: Color = .black
    @State private var animationInProgress: Bool = false

    let number: Int
    let score: Int
    let scoreType: ScoreType
    let enabled: Bool
    let onTilePressed: (() -> Void)?

    var body: some View {
        Circle()
            .frame(width: 65, height: 65)
            .foregroundStyle(enabled ? backgroundColour : .gray)
            .foregroundStyle(.white)
            .overlay {
                Text("# \(number)")
                    .font(.body)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
            }
            .onTapGesture {
                if enabled, !animationInProgress {
                    self.animationInProgress = true

                    backgroundColour = number % 2 == 0 ? .red : .green

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation {
                            backgroundColour = .black

                        }

                        onTilePressed?()

                        self.animationInProgress = false
                    }
                }
            }
            .disabled(!enabled)
    }
}

#Preview {
    TileView(number: 19,
             score: 57,
             scoreType: .triple,
             enabled: true,
             onTilePressed: { })
}

//
//  DartsPlayedView.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 22/01/2025.
//

import SwiftUI

struct DartsPlayedView: View {

    let dartsPlayed: [SingleDartScore]

    var body: some View {
        if !dartsPlayed.isEmpty {
            ScrollView {
                VStack {
                    Text("Darts played")
                        .font(.title2)
                        .padding(16)

                    Text("Total: \(dartsPlayed.count)")
                        .font(.title3)
                        .padding(8)

                    ForEach(dartsPlayed.dartsInThrouples, id: \.self) { dartsInThrouple in
                        Text(dartsInThrouple.dartsListDescription)
                    }

                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .background(.linearGradient(
                .init(
                    colors: [.pink, .red, .red]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

#Preview {
    DartsPlayedView(
        dartsPlayed: [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .double, number: 14),
            SingleDartScore(scoreType: .bull, number: 50)
        ]
    )
}

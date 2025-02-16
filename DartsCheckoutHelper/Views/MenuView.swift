//
//  MenuView.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 14/02/2025.
//

import SwiftUI

struct MenuView: View {

    @Binding var preferredGameType: GameType
    @Binding var preferredDouble: Int

    let resetGame: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            HeaderView()

            Form {
                Picker("Score", selection: $preferredGameType) {
                    Text("301").tag(GameType.three_hundred_one)
                    Text("501").tag(GameType.five_hundred_one)
                }

                Picker("Preferred Double", selection: $preferredDouble) {
                    ForEach(1...20, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
            }
            .tint(.gray)
            .foregroundStyle(.black)
            .background(.clear)
            .scrollContentBackground(.hidden)

            Spacer()

            ActionButton(buttonTitle: "Start Game") {
                resetGame()
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}

#Preview {
    MenuView(preferredGameType: .constant(.three_hundred_one),
             preferredDouble: .constant(15),
             resetGame: { /* No Action */ })
}

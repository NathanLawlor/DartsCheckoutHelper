//
//  EndGameView.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 14/02/2025.
//

import SwiftUI

struct EndGameView: View {

    @ObservedObject var gameState: GameState

    let showDartsPlayed: (() -> Void)

    var body: some View {
        VStack {
            Spacer()

            Text("Congrats, you checked out!")
                .font(.headline)
                .padding()

            if gameState.hasDartsPlayed {
                ActionButton(buttonTitle: "Show Darts Played", background: .red) {
                    showDartsPlayed()
                }
            }

            ActionButton(buttonTitle: "Main Menu") {
                showMainMenu()
            }

            Spacer()
        }
    }

    func showMainMenu() {
        gameState.gameStatus = .ready
    }
}

#Preview {
    EndGameView(gameState: gameStatePreview(),
                showDartsPlayed: { /* No Action */ })
}

fileprivate func gameStatePreview() -> GameState {
    let gameState = GameState()
    gameState.dartsPlayed = [SingleDartScore(scoreType: .triple, number: 20)]
    return gameState
}

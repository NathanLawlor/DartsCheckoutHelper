//
//  ContentView.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 21/01/2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameState: GameState = .init()
    @ObservedObject var checkoutHelper: CheckoutHelper = .init()

    @State var showCurrentScoreInput: Bool = false
    @State var showDartsPlayed: Bool = false

    var currentScore: Int {
        gameState.currentScore
    }

    var dartsPlayed: [SingleDartScore] {
        gameState.dartsPlayed
    }

    var body: some View {
        ZStack {
            VStack {
                switch gameState.gameStatus {
                case .ready:
                    MenuView(preferredGameType: $gameState.gameType,
                             preferredDouble: $checkoutHelper.preferredDouble,
                             resetGame: gameState.resetGame)

                case .inProgress:
                    let actions = GameActions(
                        onTilePressed: onTilePressed,
                        undoLastDartThrow: undoLastDartThrow,
                        showDartsPlayed: showDartsPlayedSheet,
                        showCurrentScoreInputModal: showCurrentScoreInputModal
                    )

                    DismissableView {
                        GameView(currentScore: currentScore,
                                 suggestedCheckout: gameState.suggestedCheckout,
                                 hasDartsPlayed: !dartsPlayed.isEmpty,
                                 checkoutDescription: gameState.checkoutDescription,
                                 gameActions: actions)
                    } dismiss: {
                        gameState.gameStatus = .ended
                    }

                case .ended:
                    EndGameView(gameState: gameState,
                                showDartsPlayed: showDartsPlayedSheet)
                }
            }
            .frame(maxWidth: .infinity)
            .sheet(isPresented: $showDartsPlayed) {
                DartsPlayedView(dartsPlayed: dartsPlayed)
            }

            if showCurrentScoreInput {
                TextInputPrompt(textEntered: $gameState.currentScore,
                                showingAlert: $showCurrentScoreInput)
            }
        }
        .background(.linearGradient(
            .init(
                colors: [.blue, .indigo, .indigo]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }

    func onTilePressed(scoreType: ScoreType, number: Int, score: Int) {
        gameState.recordSingleDartScore(scoreType: scoreType, number: number)
        gameState.deductScore(score)
        determineCheckout()
    }

    func undoLastDartThrow() {
        gameState.undoLastDartThrow()
        determineCheckout()
    }

    func determineCheckout() {
        let checkout = checkoutHelper.calculateCheckout(from: currentScore)
        gameState.suggestedCheckout = checkout
    }

    func showDartsPlayedSheet() {
        showDartsPlayed = true
    }

    func showCurrentScoreInputModal() {
        showCurrentScoreInput = true
    }

}

#Preview {
    ContentView()
}

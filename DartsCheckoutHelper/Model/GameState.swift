//
//  GameState.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 22/01/2025.
//

import SwiftUI

class GameState: ObservableObject {
    @Published var gameStatus: GameStatus = .ready
    @Published var gameType: GameType = .three_hundred_one
    @Published var currentScore: Int = 0
    @Published var suggestedCheckout = Checkout()
    @Published var dartsPlayed = [SingleDartScore]()

    var checkoutDescription: String {
        suggestedCheckout.dartsListDescription
    }

    var hasSuggestedCheckout: Bool {
        !suggestedCheckout.isEmpty
    }

    var hasDartsPlayed: Bool {
        !dartsPlayed.isEmpty
    }

    func resetGame() {
        currentScore = gameType.rawValue
        suggestedCheckout = Checkout()
        clearDartsPlayed()
        gameStatus = .inProgress
    }

    func recordSingleDartScore(scoreType: ScoreType, number: Int) {
        appendDartPlayed(SingleDartScore(scoreType: scoreType, number: number))
    }

    func undoLastDartThrow() {
        let singleDartScore = removeLastDartPlayed()
        currentScore += singleDartScore.score
    }

    func deductScore(_ score: Int) {
        let newScore = currentScore - score

        if newScore >= 0 {
            currentScore = newScore

            if newScore == 0 {
                gameStatus = .ended
            }
        }
    }

    func appendDartPlayed(_ dartPlayed: SingleDartScore) {
        dartsPlayed.append(dartPlayed)
    }

    func removeLastDartPlayed() -> SingleDartScore {
        dartsPlayed.removeLast()
    }

    func clearDartsPlayed() {
        dartsPlayed.removeAll()
    }

}

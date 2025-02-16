//
//  GameView.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 14/02/2025.
//

import SwiftUI

struct GameView: View {
    @State var selectedScoreType: ScoreType = .single

    let currentScore: Int
    let suggestedCheckout: Checkout
    let hasDartsPlayed: Bool
    let checkoutDescription: String
    let gameActions: GameActions

    var rows: [[Int]] {
        Array(1...20).chunked(into: 5)
    }

    var hasSuggestedCheckout: Bool {
        !suggestedCheckout.isEmpty
    }

    var canCheckout: Bool {
        suggestedCheckout.currentCheckoutScore == currentScore
    }

    var body: some View {
        VStack {
            Spacer()

            currentScoreView

            scoreTypePickerView

            numberTilesView

            suggestedCheckoutView

            Spacer()

            if hasDartsPlayed {
                ActionButton(buttonTitle: "Show Darts Played", background: .red) {
                    gameActions.showDartsPlayed()
                }
            }

            Spacer()
        }
    }

    var currentScoreView: some View {
        HStack {
            Spacer()

            Text("Current Score: \(currentScore)")
                .font(.headline)

            Button("", systemImage: "square.and.pencil") {
                gameActions.showCurrentScoreInputModal()
            }
            .foregroundStyle(.black)

            if hasDartsPlayed {
                Button("", systemImage: "arrow.uturn.backward.circle") {
                    gameActions.undoLastDartThrow()
                }
                .foregroundStyle(.black)
            }

            Spacer()
        }
    }

    var scoreTypePickerView: some View {
        Picker("Score Type:", selection: $selectedScoreType) {
            Text("Single").tag(ScoreType.single)
            Text("Double").tag(ScoreType.double)
            Text("Triple").tag(ScoreType.triple)
        }
        .foregroundStyle(.white)
        .background(.white)
        .pickerStyle(.segmented)
        .clipShape(.capsule)
        .padding()
    }

    @ViewBuilder
    var suggestedCheckoutView: some View {
        if hasSuggestedCheckout {
            VStack {
                Text(canCheckout ? "Suggested checkout" : "Suggested darts")
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(checkoutDescription)
                    .font(.body)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }
            .padding()
        } else {
            Text("Keep throwing darts...")
                .font(.body)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .padding()
        }
    }

    var numberTilesView: some View {
        VStack {
            VStack {
                ForEach(rows, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { number in
                            numberTile(number: number)
                        }
                    }
                }
            }

            HStack {
                bullTile(scoreType: .outerBull)
                bullTile(scoreType: .bull)
            }
        }
        .padding(.horizontal)
    }

    @ViewBuilder
    func numberTile(number: Int) -> some View {
        let score = number * selectedScoreType.multiplier
        let enabled = isTileEnabled(number, score)

        tile(number: number, score: score, scoreType: selectedScoreType, enabled: enabled)
    }

    @ViewBuilder
    func bullTile(scoreType: ScoreType) -> some View {
        let score = scoreType.bullScore
        let enabled = isTileEnabled(score, score)

        tile(number: score, score: score, scoreType: scoreType, enabled: enabled)
    }

    func tile(number: Int, score: Int, scoreType: ScoreType, enabled: Bool) -> some View {
        TileView(
            number: number,
            score: score,
            scoreType: scoreType,
            enabled: enabled,
            onTilePressed: {
                if enabled {
                    gameActions.onTilePressed(scoreType, number, score)
                }
            }
        )
    }

    func isTileEnabled(_ number: Int, _ tileScore: Int) -> Bool {
        var enabled = true

        if number == 25 && currentScore < 27 {
            enabled = false
        }

        else if tileScore > currentScore {
            enabled = false
        }

        else if currentScore - tileScore == 1 {
            enabled = false
        }

        else if number == currentScore, number != 50 {
            return false
        }

        else if tileScore == currentScore, number != 50, selectedScoreType != .double {
            return false
        }

        return enabled
    }
}

struct GameActions {
    let onTilePressed: ((ScoreType, Int, Int) -> Void)
    let undoLastDartThrow: (() -> Void)
    let showDartsPlayed: (() -> Void)
    let showCurrentScoreInputModal: (() -> Void)
}

#Preview {
    GameView(currentScore: 170,
             suggestedCheckout: .init(),
             hasDartsPlayed: true,
             checkoutDescription: "Triple 20, Triple 20, Bull 50",
             gameActions: .init(
                onTilePressed: { _,_,_ in /* No Action */ },
                undoLastDartThrow: { /* No Action */ },
                showDartsPlayed: { /* No Action */ },
                showCurrentScoreInputModal: { /* No Action */ }
             )
    )
}



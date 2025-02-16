//
//  CheckoutHelper.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 21/01/2025.
//

import Foundation

class CheckoutHelper: ObservableObject {

    // MARK: - Published properties

    @Published var preferredDouble: Int
    @Published var preferBull: Bool

    // MARK: - Private properties

    private var reduceScoreDecision: ReduceScoreDecision = .noPossibleReduction

    // MARK: - Init

    init(preferredDouble: Int = 20, preferBull: Bool = false) {
        self.preferredDouble = preferredDouble
        self.preferBull = preferBull
    }

    // MARK: - Calculate Checkout

    func calculateCheckout(from currentScore: Int) -> Checkout {
        // Only calculate checkout within three dart score range and above minimum double for checkout
        guard currentScore <= 170, currentScore >= 2 else {
            return Checkout()
        }

        // Set new checkout
        var checkout = Checkout()

        // Set remaining score
        var remainingScore = currentScore

        // Set preferred score
        var preferredScore = preferredDouble * 2

        // Reduce current score to preferred double score, or set up for checkout on any other double
        reduceScoreDecision = .checkPreferredCheckout

        while (remainingScore > preferredScore) {
            // Check if bull
            if remainingScore == 50 {
                checkout.append(SingleDartScore(scoreType: .bull, number: ScoreType.bull.bullScore))
                remainingScore = checkout.remainingScore(from: currentScore)
            }

            // Set up for preferred double, or preferred bull
            else if reduceScoreDecision == .checkPreferredCheckout {
                usePreferredCheckout(currentScore, &remainingScore, reduceTo: preferredScore, &checkout)
            }

            // Set up for a checkout on double, or bull if preferred
            else if reduceScoreDecision == .checkPossibleCheckout {
                usePossibleCheckout(currentScore, &remainingScore, reduceTo: preferredScore, &checkout)
            }

            // Reduce score as close as possible to preferred score
            else {
                reduceScore(currentScore, &remainingScore, reduceTo: preferredScore, &checkout)
            }
        }

        // Set up for checkout on double with remaining score
        checkoutOnDouble(currentScore, &remainingScore, &checkout)

        // Return a maximum of three darts
        return Array(checkout.prefix(3))
    }

    // MARK: - Helper

    private func usePreferredCheckout(_ currentScore: Int, _ remainingScore: inout Int, reduceTo preferredScore: Int, _ checkout: inout Checkout) {
        for number in stride(from: 20, to: 1, by: -1) {
            let remainderFromTriple = remainingScore - (number * 3)
            let remainderFromDouble = remainingScore - (number * 2)
            let remainderFromSingle = remainingScore - (number * 1)

            // Check preferred double score, or preferred bull

            if remainderFromSingle == preferredScore || (remainderFromSingle == 50 && preferBull)  {
                checkout.append(SingleDartScore(scoreType: .single, number: number))
                break
            }

            else if remainderFromDouble == preferredScore || (remainderFromDouble == 50 && preferBull) {
                checkout.append(SingleDartScore(scoreType: .double, number: number))
                break
            }

            else if remainderFromTriple == preferredScore || (remainderFromTriple == 50 && preferBull) {
                checkout.append(SingleDartScore(scoreType: .triple, number: number))
                break
            }

            else {
                reduceScoreDecision = .checkPossibleCheckout
            }
        }

        remainingScore = checkout.remainingScore(from: currentScore)
    }

    private func usePossibleCheckout(_ currentScore: Int, _ remainingScore: inout Int, reduceTo preferredScore: Int, _ checkout: inout Checkout) {
        for number in stride(from: 20, to: 1, by: -1) {
            let remainderFromTriple = remainingScore - (number * 3)
            let remainderFromDouble = remainingScore - (number * 2)
            let remainderFromSingle = remainingScore - (number * 1)

            if remainderFromSingle < preferredScore && remainderFromSingle % 2 == 0 {
                checkout.append(SingleDartScore(scoreType: .single, number: number))
                reduceScoreDecision = .checkPreferredCheckout
                break
            }

            // TODO: Remove - this is not needed for any calculations between 0 and 170

//            else if remainderFromDouble < preferredScore && remainderFromDouble % 2 == 0 {
//                checkout.append(SingleDartScore(scoreType: .double, number: number))
//                reduceScoreDecision = .checkPreferredCheckout
//                break
//            }

            else if remainderFromTriple < preferredScore && remainderFromTriple % 2 == 0 {
                checkout.append(SingleDartScore(scoreType: .triple, number: number))
                reduceScoreDecision = .checkPreferredCheckout
                break
            }

            else {
                reduceScoreDecision = .checkPossibleReduction
            }
        }

        remainingScore = checkout.remainingScore(from: currentScore)
    }

    private func reduceScore(_ currentScore: Int, _ remainingScore: inout Int, reduceTo preferredScore: Int, _ checkout: inout Checkout) {

        // Reduce score to desired score as close as possible
        for number in stride(from: 20, to: 1, by: -1) {
            let remainderFromTriple = remainingScore - (number * 3)
            let remainderFromDouble = remainingScore - (number * 2)
            let remainderFromSingle = remainingScore - (number * 1)

            if remainderFromTriple > preferredScore {
                checkout.append(SingleDartScore(scoreType: .triple, number: number))
                reduceScoreDecision = .checkPreferredCheckout
                break
            }

            // TODO: Remove - this is not needed for any calculations between 0 and 170

//            else if remainderFromDouble > preferredScore {
//                checkout.append(SingleDartScore(scoreType: .double, number: number))
//                reduceScoreDecision = .checkPreferredCheckout
//                break
//            }

            else if remainderFromSingle > preferredScore {
                checkout.append(SingleDartScore(scoreType: .single, number: number))
                reduceScoreDecision = .checkPreferredCheckout
                break
            }
        }

        remainingScore = checkout.remainingScore(from: currentScore)
    }

    private func checkoutOnDouble(_ currentScore: Int, _ remainingScore: inout Int, _ checkout: inout Checkout) {
        while (remainingScore > 0) {
            if remainingScore >= 2, remainingScore % 2 == 0 {
                checkout.append(SingleDartScore(scoreType: .double, number: remainingScore / 2))
            }

            else if remainingScore > 20 {
                checkout.append(SingleDartScore(scoreType: .single, number: remainingScore - 20))
            }

            else if remainingScore > 2 {
                checkout.append(SingleDartScore(scoreType: .single, number: remainingScore - 2))
            }

            remainingScore = checkout.remainingScore(from: currentScore)
        }
    }

    // MARK: - Enums

    private enum ReduceScoreDecision: Int {
        case checkPreferredCheckout = 1 // Higher number is better
        case checkPossibleCheckout = 2
        case checkPossibleReduction = 3
        case noPossibleReduction = 4 // Lower number is worse
    }

    // TODO: Allow for suggested darts even if not a possible checkout. Will need a new enum for return type to frontend.
}

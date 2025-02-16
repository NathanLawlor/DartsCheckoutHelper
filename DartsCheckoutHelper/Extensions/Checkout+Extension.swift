//
//  Checkout.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 21/01/2025.
//

import Foundation

typealias Checkout = [SingleDartScore]

extension Checkout {
    var currentCheckoutScore: Int {
        self.map({
            if $0.scoreType.isBullScoreType {
                return $0.scoreType.bullScore
            } else {
                return $0.scoreType.multiplier * $0.number
            }

        })
        .reduce(0, +)
    }

    func remainingScore(from totalScore: Int) -> Int {
        totalScore - currentCheckoutScore
    }

    var dartsInThrouples: [[SingleDartScore]] {
        self.chunked(into: 3)
    }
}

//
//  SingleDartScore.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 21/01/2025.
//

import Foundation

struct SingleDartScore: Hashable {
    let scoreType: ScoreType
    let number: Int

    var description: String {
        "\(scoreType.rawValue) \(number)"
    }


    var score: Int {
        switch scoreType {
        case .single, .double, .triple:
            return number * scoreType.multiplier
        case .bull, .outerBull:
            return scoreType.bullScore
        }
    }
}

extension Array where Element == SingleDartScore {
    var dartsListDescription: String {
        var text = ""
        for singleDartScore in self {
            text += "\(singleDartScore.description), "
        }
        return text
    }

    var dartsListCombinedScore: Int {
        self.map({ $0.score })
            .reduce(0, +)
    }
}

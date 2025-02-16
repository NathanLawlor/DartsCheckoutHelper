//
//  ScoreType.swift
//  DartsCheckoutHelper
//
//  Created by nlawlor on 21/01/2025.
//

import Foundation

enum ScoreType: String{
    case single = "Single"
    case double = "Double"
    case triple = "Triple"
    case bull = "Bull"
    case outerBull = "Outer Bull"

    static let allBasicCases: [ScoreType] = [.single, .double, .triple]
    static let allBullCases: [ScoreType] = [.bull, .outerBull]
    static let allBasicCasesReversed: [ScoreType] = [.triple, .double, .single]

    var multiplier: Int {
        switch self {
        case .single:
            return 1
        case .double:
            return 2
        case .triple:
            return 3
        default:
            return 0
        }
    }

    var isBullScoreType: Bool {
        self == .bull || self == .outerBull
    }

    var bullScore: Int {
        switch self {
        case .bull:
            return 50
        case .outerBull:
            return 25
        default:
            return 0
        }
    }
}

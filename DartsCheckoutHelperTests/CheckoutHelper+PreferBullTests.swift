//
//  CheckoutHelper+PreferBullTests.swift
//  DartsCheckoutHelperTests
//
//  Created by nlawlor on 26/01/2025.
//

import XCTest
@testable import DartsCheckoutHelper

final class CheckoutHelperPreferBullTests: XCTestCase {

    let checkoutHelper = CheckoutHelper(preferBull: true)

    // MARK: - Preferred Bull

    func test_checkoutHelper__preferBull_checkoutWhenScoreIs101() {
        let checkout = checkoutHelper.calculateCheckout(from: 101)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 17),
            SingleDartScore(scoreType: .bull, number: 50)
        ])
    }

    func test_checkoutHelper_preferBull_checkoutWhenScoreIs61() {
        let checkout = checkoutHelper.calculateCheckout(from: 61)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .single, number: 11),
            SingleDartScore(scoreType: .bull, number: 50)
        ])
    }

}

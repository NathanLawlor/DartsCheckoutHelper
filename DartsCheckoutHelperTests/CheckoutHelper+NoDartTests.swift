//
//  CheckoutHelper+NoDartTests.swift
//  DartsCheckoutHelperTests
//
//  Created by nlawlor on 21/01/2025.
//

import XCTest
@testable import DartsCheckoutHelper

final class CheckoutHelper_NoDartTests: XCTestCase {

    let checkoutHelper = CheckoutHelper()

    // MARK: - Score 0

    func test_checkoutHelper_noCheckoutWhenScoreIs0() {
        let checkout = checkoutHelper.calculateCheckout(from: 0)

        XCTAssertTrue(checkout.isEmpty)
    }

    // MARK: - Score 1

    func test_checkoutHelper_noCheckoutWhenScoreIs1() {
        let checkout = checkoutHelper.calculateCheckout(from: 1)

        XCTAssertTrue(checkout.isEmpty)
    }

    // MARK: - All

    // NOTE: Used to check that all calculations from 0 to 170 do not cause an infinite loop

    func test_allCalculationsFrom0to170() {
        for n in 0...170 {
            let checkout = checkoutHelper.calculateCheckout(from: n)
        }
    }

}

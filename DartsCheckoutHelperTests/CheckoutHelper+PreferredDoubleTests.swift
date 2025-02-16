//
//  CheckoutHelper+PreferredDoubleTests.swift
//  DartsCheckoutHelperTests
//
//  Created by nlawlor on 26/01/2025.
//

import XCTest
@testable import DartsCheckoutHelper

final class CheckoutHelperPreferredDoubleTests: XCTestCase {

    let checkoutHelper = CheckoutHelper()

    // MARK: - Preferred Double 

    func test_checkoutHelper_preferredDouble16_checkoutWhenScoreIs39() {
        checkoutHelper.preferredDouble = 16

        let checkout = checkoutHelper.calculateCheckout(from: 39)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .single, number: 7),
            SingleDartScore(scoreType: .double, number: 16)
        ])
    }

    func test_checkoutHelper_preferredDouble10_checkoutWhenScoreIs34() {
        checkoutHelper.preferredDouble = 10

        let checkout = checkoutHelper.calculateCheckout(from: 34)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .single, number: 14),
            SingleDartScore(scoreType: .double, number: 10)
        ])
    }

    func test_checkoutHelper_preferredDouble17_checkoutWhenScoreIs54() {
        checkoutHelper.preferredDouble = 17

        let checkout = checkoutHelper.calculateCheckout(from: 54)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .single, number: 20),
            SingleDartScore(scoreType: .double, number: 17)
        ])
    }

    func test_checkoutHelper_preferredDouble17_checkoutWhenScoreIs56() {
        checkoutHelper.preferredDouble = 17

        let checkout = checkoutHelper.calculateCheckout(from: 56)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .double, number: 11),
            SingleDartScore(scoreType: .double, number: 17)
        ])
    }

}

//
//  CheckoutHelper+TwoDartTests.swift
//  DartsCheckoutHelperTests
//
//  Created by nlawlor on 21/01/2025.
//

import XCTest
@testable import DartsCheckoutHelper

final class CheckoutHelper_TwoDartTests: XCTestCase {

    let checkoutHelper = CheckoutHelper()

    // MARK: - Score 3 - 39

    func test_checkoutHelper_checkoutWhenScoreIs3() {
        let checkout = checkoutHelper.calculateCheckout(from: 3)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .single, number: 1),
            SingleDartScore(scoreType: .double, number: 1)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs39() {
        let checkout = checkoutHelper.calculateCheckout(from: 39)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .single, number: 19),
            SingleDartScore(scoreType: .double, number: 10)
        ])
    }

    // MARK: - Score 41 - 110

    func test_checkoutHelper_checkoutWhenScoreIs41() {
        let checkout = checkoutHelper.calculateCheckout(from: 41)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .single, number: 19),
            SingleDartScore(scoreType: .double, number: 11)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs51() {
        let checkout = checkoutHelper.calculateCheckout(from: 51)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .single, number: 11),
            SingleDartScore(scoreType: .double, number: 20)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs61() {
        let checkout = checkoutHelper.calculateCheckout(from: 61)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 7),
            SingleDartScore(scoreType: .double, number: 20)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs100() {
        let checkout = checkoutHelper.calculateCheckout(from: 100)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .double, number: 20)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs110() {
        let checkout = checkoutHelper.calculateCheckout(from: 110)

        XCTAssertEqual(checkout.count, 2)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .bull, number: 50)
        ])
    }

}

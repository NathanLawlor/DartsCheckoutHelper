//
//  CheckoutHelperThreeDartTests.swift
//  DartsCheckoutHelperTests
//
//  Created by nlawlor on 21/01/2025.
//

import XCTest
@testable import DartsCheckoutHelper

final class CheckoutHelperThreeDartTests: XCTestCase {

    let checkoutHelper = CheckoutHelper()

    // MARK: - Score 101 - 160

    func test_checkoutHelper_checkoutWhenScoreIs101() {
        let checkout = checkoutHelper.calculateCheckout(from: 101)

        XCTAssertEqual(checkout.count, 3)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .single, number: 19),
            SingleDartScore(scoreType: .double, number: 11)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs120() {
        let checkout = checkoutHelper.calculateCheckout(from: 120)

        XCTAssertEqual(checkout.count, 3)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .single, number: 20),
            SingleDartScore(scoreType: .double, number: 20)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs122() {
        let checkout = checkoutHelper.calculateCheckout(from: 122)

        XCTAssertEqual(checkout.count, 3)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .double, number: 11),
            SingleDartScore(scoreType: .double, number: 20)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs140() {
        let checkout = checkoutHelper.calculateCheckout(from: 140)

        XCTAssertEqual(checkout.count, 3)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .double, number: 20),
            SingleDartScore(scoreType: .double, number: 20)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs143() {
        let checkout = checkoutHelper.calculateCheckout(from: 143)

        XCTAssertEqual(checkout.count, 3)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .triple, number: 19),
            SingleDartScore(scoreType: .double, number: 13)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs148() {
        let checkout = checkoutHelper.calculateCheckout(from: 148)

        XCTAssertEqual(checkout.count, 3)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .triple, number: 16),
            SingleDartScore(scoreType: .double, number: 20)
        ])
    }

    func test_checkoutHelper_checkoutWhenScoreIs160() {
        let checkout = checkoutHelper.calculateCheckout(from: 160)

        XCTAssertEqual(checkout.count, 3)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .double, number: 20)
        ])
    }

    // MARK: - Score 165

    func test_checkoutHelper_suggestedDartsWhenScoreIs165() {
        let checkout = checkoutHelper.calculateCheckout(from: 165)

        XCTAssertEqual(checkout.count, 3)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .single, number: 5)
        ])

        // Check remaining score is set for a checkout on double
        XCTAssertEqual(165 - checkout.currentCheckoutScore, 40)
    }

    // MARK: - Score 170 (Big Fish)

    func test_checkoutHelper_checkoutWhenScoreIs170() {
        let checkout = checkoutHelper.calculateCheckout(from: 170)

        XCTAssertEqual(checkout.count, 3)

        XCTAssertEqual(checkout, [
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .triple, number: 20),
            SingleDartScore(scoreType: .bull, number: 50)
        ])
    }

    // MARK: - Score Greater Than 170

    // TODO: Create tests for suggested darts (instead of checkouts)

//    func test_checkoutHelper_suggestedDartsWhenScoreIs171() {
//        let checkout = checkoutHelper.calculateCheckout(from: 171)
//
//        XCTAssertEqual(checkout.count, 3)
//
//        XCTAssertEqual(checkout, [
//            SingleDartScore(scoreType: .triple, number: 20),
//            SingleDartScore(scoreType: .triple, number: 20),
//            SingleDartScore(scoreType: .single, number: 19)
//        ])
//    }
//
//    func test_checkoutHelper_suggestedDartsWhenScoreIs501() {
//        let checkout = checkoutHelper.calculateCheckout(from: 501)
//
//        XCTAssertEqual(checkout.count, 3)
//
//        XCTAssertEqual(checkout, [
//            SingleDartScore(scoreType: .triple, number: 20),
//            SingleDartScore(scoreType: .triple, number: 20),
//            SingleDartScore(scoreType: .triple, number: 20)
//        ])
//    }

}

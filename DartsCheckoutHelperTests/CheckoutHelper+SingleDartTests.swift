//
//  CheckoutHelperSingleDartTests.swift
//  DartsCheckoutHelperTests
//
//  Created by nlawlor on 21/01/2025.
//

import XCTest
@testable import DartsCheckoutHelper

final class CheckoutHelperSingleDartTests: XCTestCase {

    let checkoutHelper = CheckoutHelper()

    // MARK: - Score 2 - 40 (Checkout on Double)

    func test_checkoutHelper_checkoutWhenScoreIs2() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 2)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 1))
    }

    func test_checkoutHelper_checkoutWhenScoreIs4() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 4)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 2))
    }

    func test_checkoutHelper_checkoutWhenScoreIs6() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 6)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 3))
    }

    func test_checkoutHelper_checkoutWhenScoreIs8() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 8)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 4))
    }

    func test_checkoutHelper_checkoutWhenScoreIs10() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 10)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 5))
    }

    func test_checkoutHelper_checkoutWhenScoreIs12() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 12)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 6))
    }

    func test_checkoutHelper_checkoutWhenScoreIs14() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 14)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 7))
    }

    func test_checkoutHelper_checkoutWhenScoreIs16() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 16)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 8))
    }

    func test_checkoutHelper_checkoutWhenScoreIs18() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 18)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 9))
    }

    func test_checkoutHelper_checkoutWhenScoreIs20() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 20)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 10))
    }

    func test_checkoutHelper_checkoutWhenScoreIs22() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 22)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 11))
    }

    func test_checkoutHelper_checkoutWhenScoreIs24() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 24)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 12))
    }

    func test_checkoutHelper_checkoutWhenScoreIs26() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 26)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 13))
    }

    func test_checkoutHelper_checkoutWhenScoreIs28() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 28)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 14))
    }

    func test_checkoutHelper_checkoutWhenScoreIs30() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 30)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 15))
    }

    func test_checkoutHelper_checkoutWhenScoreIs32() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 32)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 16))
    }

    func test_checkoutHelper_checkoutWhenScoreIs34() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 34)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 17))
    }

    func test_checkoutHelper_checkoutWhenScoreIs36() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 36)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 18))
    }

    func test_checkoutHelper_checkoutWhenScoreIs38() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 38)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 19))
    }

    func test_checkoutHelper_checkoutWhenScoreIs40() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 40)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .double, number: 20))
    }

    // MARK: - Score 50 (Bull)

    func test_checkoutHelper_checkoutWhenScoreIs50() throws {
        let checkout = checkoutHelper.calculateCheckout(from: 50)

        XCTAssertEqual(checkout.count, 1)

        let firstDart = try XCTUnwrap(checkout.first)

        XCTAssertEqual(firstDart, SingleDartScore(scoreType: .bull, number: 50))
    }

}

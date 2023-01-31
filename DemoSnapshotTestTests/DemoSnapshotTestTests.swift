//
//  DemoSnapshotTestTests.swift
//  DemoSnapshotTestTests
//
//  Created by Meik Schuetz on 31/01/2023.
//

import XCTest
import SnapshotTesting
@testable import DemoSnapshotTest

final class DemoSnapshotTestTests: XCTestCase {
    func testImageMatchingReference() throws {
        let image = try XCTUnwrap(UIImage(named: "swift", in: Bundle(for: Self.self), compatibleWith: nil))

        assertSnapshot(
            matching: image, 
            as: .image(
                precision: Constants.snapshotPrecision, 
                perceptualPrecision: Constants.snapshotPerceptualPrecision))
    }
    
    func testImageNotMatchingReference() throws {
        let image = try XCTUnwrap(UIImage(named: "swift", in: Bundle(for: Self.self), compatibleWith: nil))

        assertSnapshot(
            matching: image, 
            as: .image(
                precision: Constants.snapshotPrecision, 
                perceptualPrecision: Constants.snapshotPerceptualPrecision))
    }
    
    func testSimplySucceeding() throws {
        XCTAssertTrue(true)
    }
    
    func testSimplyFailing() throws {
        XCTAssertTrue(false)
    }
}

extension DemoSnapshotTestTests {
    enum Constants {
        static let snapshotPrecision = Float(1)
        static let snapshotPerceptualPrecision = Float(0.99)
    }
}

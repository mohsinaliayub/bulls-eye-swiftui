//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Mohsin Ali Ayub on 23.09.25.
//

import XCTest
@testable import BullsEye

final class BullsEyeTests: XCTestCase {
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let points = game.points(for: guess)
        
        XCTAssertEqual(points, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let points = game.points(for: guess)
        
        XCTAssertEqual(points, 95)
    }
}

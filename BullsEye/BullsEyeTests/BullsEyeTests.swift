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
    
    func testScoreExact() {
        let guess = game.target
        let points = game.points(for: guess)
        
        let expectedPoints = 100 + 100 // 100 bonus points
        
        XCTAssertEqual(points, expectedPoints)
    }
    
    func testScoreClose() {
        let guess = game.target - 2
        let points = game.points(for: guess)
        
        let expectedPoints = 98 + 50 // 50 bonus points
        
        XCTAssertEqual(points, expectedPoints)
    }
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
}

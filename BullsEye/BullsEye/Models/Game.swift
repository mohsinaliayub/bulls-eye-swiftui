//
//  Game.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 23.09.25.
//

import Foundation

struct Game {
    /// A random target value the player must try to match as close as they can.
    ///
    /// The random Int value is set when either a new round of the game begins
    /// or the player starts over the game completely. This random value is between
    /// 1 and 100 (inclusive), the slider's minimum and maximum values, respectively.
    private(set) var target = 0
    /// The player's total score aggregated over multiple rounds.
    private(set) var score = 0
    /// The current round being played.
    ///
    /// The round increments everytime the player makes a match. The round gets reset when a new game starts.
    private(set) var round = 0
    
    init() {
        // Set a fresh game for the player.
        restart()
    }
    
    /// Calculates the total points for a difference between target value and player's guess.
    /// - Parameter sliderValue: The slider's current value rounded to the nearest integer.
    /// - Returns: A score based on player's effort, plus any bonus score.
    ///
    /// The player is awarded additional bonus points on how good they did in matching the target value:
    /// - The player is awarded 100 bonus points if difference is 0.
    /// - The player is awarded 50 bonus points if difference is only 1.
    func points(for sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let awardedPoints = 100 - difference
        let bonusPoints = bonusPoints(for: difference)
        return awardedPoints + bonusPoints
    }
    
    /// Updates the score and sets up a new round for the player.
    /// - Parameter points: The number of points scored by the user in current round.
    ///
    /// Updates the target value with a random Int between slider's minimum and maximum value,
    /// plus sets the slider's current value to be halfway in between its minimum and maximum value.
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    /// Calculates the bonus points for a difference between target and player's guess.
    /// - Parameter difference: The absolute difference between target and current value.
    /// - Returns: A bonus score based on player's effort.
    ///
    /// The player is awarded bonus points on how good they did in matching the target value:
    /// - The player is awarded 100 bonus points if difference is 0.
    /// - The player is awarded 50 bonus points if difference is either a 1 or 2.
    private func bonusPoints(for difference: Int) -> Int {
        switch difference {
        case 0: return 100
        case 1, 2: return 50
        default: return 0
        }
    }
    
    /// Sets up a fresh game for the player.
    ///
    /// It resets the score, round and target values for the game.
    mutating func restart() {
        score = 0
        round = 0
        startNewRound(points: 0)
    }
}

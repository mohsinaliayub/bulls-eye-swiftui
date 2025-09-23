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
    var target: Int = 37
    /// The player's total score aggregated over multiple rounds.
    var score: Int = 0
    /// The current round being played.
    ///
    /// The round increments everytime the player makes a match. The round gets reset when a new game starts.
    var round: Int = 1
    
    /// Calculates the total points for a difference between target and current value.
    /// - Parameter sliderValue: The slider's current value rounded to the nearest integer.
    /// - Returns: A score based on player's effort, plus any bonus score.
    ///
    /// The player is awarded additional bonus points on how good they did in matching the target value:
    /// - The player is awarded 100 bonus points if difference is 0.
    /// - The player is awarded 50 bonus points if difference is only 1.
    func points(for sliderValue: Int) -> Int {
        return 999
    }
}

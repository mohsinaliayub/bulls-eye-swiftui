//
//  PointsView.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 25.09.25.
//

import SwiftUI

struct PointsView: View {
    let sliderValue: Int
    @Binding var game: Game
    
    var body: some View {
        VStack(spacing: 10) {
            InstructionText("The slider's value is")
            BigNumberText(number: sliderValue)
            BodyText("You scored \(game.points(for: sliderValue)) Points\n🎉🎉🎉")
            Button {
                game.startNewRound(points: game.points(for: sliderValue))
            } label: {
                ButtonText("Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .clipShape(RoundedRectangle(cornerRadius: 21))
        .shadow(radius: 10, x: 5, y: 5)
    }
}

#Preview("Portrait") {
    PointsView(sliderValue: 50, game: .constant(Game()))
}

#Preview("Landscape Left", traits: .landscapeLeft) {
    PointsView(sliderValue: 50, game: .constant(Game()))
}

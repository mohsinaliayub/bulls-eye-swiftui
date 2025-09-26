//
//  PointsView.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 25.09.25.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        let sliderValue = Int(game.sliderValue.rounded())
        let points = game.points(for: sliderValue)
        VStack(spacing: 10) {
            InstructionText("The slider's value is")
            BigNumberText(number: sliderValue)
            BodyText("You scored \(points) Points\n🎉🎉🎉")
            Button {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            } label: {
                ButtonText("Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .clipShape(RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius))
        .shadow(radius: 10, x: 5, y: 5)
    }
}

#Preview("Portrait") {
    PointsView(alertIsVisible: .constant(true), game: .constant(Game()))
}

#Preview("Landscape Left", traits: .landscapeLeft) {
    PointsView(alertIsVisible: .constant(true), game: .constant(Game()))
}

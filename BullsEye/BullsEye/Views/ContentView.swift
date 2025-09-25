//
//  ContentView.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 23.09.25.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    private var roundedSliderValue: Int {
        Int(round(sliderValue))
    }
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            
            VStack {
                InstructionsView(game: game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, game: $game, sliderValue: roundedSliderValue)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, game: $game)
                }
            }
            
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
            }
        }
    }
}

struct InstructionsView: View {
    let game: Game
    
    var body: some View {
        VStack {
            InstructionText("🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.horizontal)
            BigNumberText(number: game.target)
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText("1")
                .frame(width: 35, alignment: .trailing)
            Slider(value: $sliderValue, in: 1...100)
            SliderLabelText("100")
                .frame(width: 35)
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        Button("Hit Me".uppercased()) {
            alertIsVisible = true
        }
        .padding(20)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(colors: [.white.opacity(0.3), .clear], startPoint: .top, endPoint: .bottom)
            }
        )
        .overlay(
            RoundedRectangle(cornerRadius: 21)
                .strokeBorder(Color.white, lineWidth: 2)
        )
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 21))
        .bold()
        .font(.title3)
    }
}

#Preview("Light") {
    ContentView()
}

#Preview("Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}

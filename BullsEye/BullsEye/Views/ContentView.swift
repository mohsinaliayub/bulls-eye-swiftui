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
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                InstructionsView(game: game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: sliderValue, game: game)
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
            Slider(value: $sliderValue, in: 1...100)
            SliderLabelText("100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    let sliderValue: Double
    let game: Game
    
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
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 21))
        .bold()
        .font(.title3)
        .alert(
            "Hello there!",
            isPresented: $alertIsVisible,
            actions: {
                Button("Awesome") {
                    print("Alert Dismissed!")
                }
            },
            message: {
                let roundedValue = Int(round(sliderValue))
                let points = game.points(for: roundedValue)
                let message = """
                    The slider's value is \(roundedValue).
                    You scored \(points) this round.
                    """
                Text(message)
            }
        )
    }
}

#Preview("Light") {
    ContentView()
}

#Preview("Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}

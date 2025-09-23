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
        VStack {
            Text("🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
                .bold()
                .kerning(2)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal)
            Text(String(game.target))
                .fontWeight(.black)
                .kerning(-1)
                .font(.largeTitle)
            HStack {
                Text("1").bold()
                Slider(value: $sliderValue, in: 1...100)
                Text("100").bold()
            }
            .padding()
            Button("Hit Me".uppercased()) {
                alertIsVisible = true
            }
            .padding(20)
            .background(
                Color.blue
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
}

#Preview {
    ContentView()
}

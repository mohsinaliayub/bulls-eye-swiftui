//
//  BackgroundView.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 24.09.25.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            restartButton
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
    
    private var restartButton: some View {
        Button {
            game.restart()
        } label: {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", number: game.score)
            Spacer()
            NumberView(title: "Round", number: game.round)
        }
    }
}

struct NumberView: View {
    let title: String
    let number: Int
    
    var body: some View {
        VStack(spacing: 5) {
            LabelText(title)
            RoundedRectTextView(String(number))
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ForEach(1..<6) { index in
                let size: CGFloat = CGFloat(index * 100)
                let opacityMultiplier = colorScheme == .dark ? 0.1 : 0.3
                let gradient = RadialGradient(
                    colors: [Color("RingsColor").opacity(opacityMultiplier * 0.8),
                             Color("RingsColor").opacity(0)],
                    center: .center,
                    startRadius: 100,
                    endRadius: 300
                )
                Circle()
                    .stroke(gradient, lineWidth: 20)
                    .frame(width: size, height: size)
            }
        }
    }
}

#Preview {
    
    BackgroundView(game: .constant(Game()))
}

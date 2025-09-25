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
            Color("BackgroundColor")
                .ignoresSafeArea()
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

#Preview {
    
    BackgroundView(game: .constant(Game()))
}

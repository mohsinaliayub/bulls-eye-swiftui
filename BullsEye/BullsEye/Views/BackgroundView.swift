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
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
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
        Color.gray
            .frame(width: 56, height: 56)
    }
}

#Preview {
    
    BackgroundView(game: .constant(Game()))
}

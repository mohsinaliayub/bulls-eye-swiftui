//
//  LeaderboardView.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 26.09.25.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                HeaderView()
                LabelView()
                leaderboardRows
            }
        }
    }
    
    private var leaderboardRows: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(game.leaderboardEntries.indices, id: \.self) { index in
                    let entry = game.leaderboardEntries[index]
                    RowView(index: index + 1, score: entry.score, date: entry.date)
                }
            }
        }
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            HStack {
                BigBoldText(text: "Leaderboard")
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                }
            }
        }
        .padding([.horizontal, .top])
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText("Score")
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            LabelText("Date")
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

#Preview("Light") {
    LeaderboardView(game: .constant(Game(loadTestData: true)))
}

#Preview("Dark") {
    LeaderboardView(game: .constant(Game(loadTestData: true)))
        .preferredColorScheme(.dark)
}

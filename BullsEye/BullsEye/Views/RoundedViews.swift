//
//  RoundedViews.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 24.09.25.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundStyle(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
            )
    }
}

struct RoundedImageViewFilled: View {
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundStyle(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundedViewsPreview: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "list.dash")
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundedRectTextView("100")
        }
    }
}

struct RoundedRectTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .foregroundStyle(Color("TextColor"))
            .frame(width: 68, height: 56)
            .overlay(
                RoundedRectangle(cornerRadius: 21)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
            )
    }
    
    init(_ text: String) {
        self.text = text
    }
}

#Preview("Light") {
    RoundedViewsPreview()
}

#Preview("Dark") {
    RoundedViewsPreview()
        .preferredColorScheme(.dark)
}

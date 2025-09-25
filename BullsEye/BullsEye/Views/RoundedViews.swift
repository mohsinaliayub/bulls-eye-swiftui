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
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageViewFilled: View {
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundStyle(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
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
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
    
    init(_ text: String) {
        self.text = text
    }
}

struct RoundedTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        self.text = text
    }
}

struct RoundedViewsPreview: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "list.dash")
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundedRectTextView("100")
            RoundedTextView("1")
        }
    }
}

#Preview("Light") {
    RoundedViewsPreview()
}

#Preview("Dark") {
    RoundedViewsPreview()
        .preferredColorScheme(.dark)
}

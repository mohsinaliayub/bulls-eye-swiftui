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
    }
}

struct RoundedImageViewFilled: View {
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundStyle(Color("TextColor"))
            .frame(width: 56, height: 56)
    }
}

struct RoundedViewsPreview: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "list.dash")
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
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

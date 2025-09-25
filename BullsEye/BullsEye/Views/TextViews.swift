//
//  TextViews.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 24.09.25.
//

import SwiftUI

struct InstructionText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2)
            .font(.footnote)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .foregroundStyle(Color("TextColor"))
    }
    
    init(_ text: String) {
        self.text = text
    }
}

struct BigNumberText: View {
    let number: Int
    
    var body: some View {
        Text(String(number))
            .fontWeight(.black)
            .kerning(-1)
            .font(.largeTitle)
            .foregroundStyle(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundStyle(Color("TextColor"))
    }
    
    init(_ text: String) {
        self.text = text
    }
}

struct LabelText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .font(.caption)
            .foregroundStyle(Color("TextColor"))
    }
    
    init(_ text: String) {
        self.text = text
    }
}

struct BodyText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
    
    init(_ text: String) {
        self.text = text
    }
}

struct ButtonText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    init(_ text: String) {
        self.text = text
    }
}

#Preview {
    InstructionText("🎯🎯🎯\nPut the Bullseye as close as you can to")
    BigNumberText(number: 999)
    SliderLabelText("99")
    LabelText("Score")
    BodyText("You scored 200 Points\n🎉🎉🎉")
    ButtonText("Start New Round").padding(.horizontal)
}

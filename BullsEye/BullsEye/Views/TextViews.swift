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

#Preview {
    InstructionText("🎯🎯🎯\nPut the Bullseye as close as you can to")
    BigNumberText(number: 999)
    SliderLabelText("99")
}

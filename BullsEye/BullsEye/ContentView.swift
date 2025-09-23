//
//  ContentView.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 23.09.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
            Text("89")
            HStack {
                Text("1")
                Slider(value: .constant(50), in: 1...100)
                Text("100")
            }
            Button("Hit Me") {
                
            }
        }
    }
}

#Preview {
    ContentView()
}

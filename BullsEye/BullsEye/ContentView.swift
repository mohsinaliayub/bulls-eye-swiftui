//
//  ContentView.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 23.09.25.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
            Text("89")
                .fontWeight(.black)
                .kerning(-1)
                .font(.largeTitle)
            HStack {
                Text("1").bold()
                Slider(value: .constant(50), in: 1...100)
                Text("100").bold()
            }
            Button("Hit Me") {
                alertIsVisible = true
            }
        }
    }
}

#Preview {
    ContentView()
}

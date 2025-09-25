//
//  Shapes.swift
//  BullsEye
//
//  Created by Mohsin Ali Ayub on 24.09.25.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                //                .fill(Color.blue)
                //                .inset(by: 10)
                //                .stroke(Color.blue, lineWidth: 20)
                    .strokeBorder(Color.blue, lineWidth: 20)
                    .frame(width: 200, height: 100)
                    .background(Color.green)
                    .transition(.scale)
            }
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
//                .animation(.easeInOut, value: wideShapes)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            
            Button("Animate!") {
                withAnimation(.easeInOut) {
                    wideShapes.toggle()
                }
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    Shapes()
}

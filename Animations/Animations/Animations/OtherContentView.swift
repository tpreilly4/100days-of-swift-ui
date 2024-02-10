//
//  OtherContentView.swift
//  Animations
//
//  Created by Tom Reilly on 2/10/24.
//

import Foundation

//
//  ContentView.swift
//  Animations
//
//  Created by Tom Reilly on 2/10/24.
//

import SwiftUI

struct OtherContentView: View {
    @State private var animationAmount = 1.0
    @State private var rotationAmount = 0.0
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(.easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)), in: 1...10, step: 0.5)

            Button("Tap Me") {
                withAnimation (.spring(duration: 1, bounce: 0.5)){
                    rotationAmount += 360
                }
            }
            .myRoundButton(with: .blue, with: animationAmount)
            .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))

        }
    }
}

#Preview {
    OtherContentView()
}


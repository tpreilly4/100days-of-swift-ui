//
//  ContentView.swift
//  Animations
//
//  Created by Tom Reilly on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        VStack {
            Button("Tap Me") {
                doAnimation()
            }
            .myRoundButton(with: .red, with: animationAmount)
            .animation(.default, value: animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            
            Button("Tap Me"){
                doAnimation()
            }
            .myRoundButton(with: .yellow, with: animationAmount)
            .overlay(Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2-animationAmount)
                .animation(
                    .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
            )
            .onAppear {
                animationAmount = 2
            }
            
            Button("Tap Me"){
                doAnimation()
            }
            .myRoundButton(with: .green, with: animationAmount)
            .animation(.easeInOut(duration: 2).delay(1).repeatCount(3, autoreverses: true), value: animationAmount)
        }
        .padding()
    }
    
    func doAnimation() {
        if animationAmount == 3{
            animationAmount = 1
        } else{
            animationAmount += 1
        }
    }
}

struct MyRoundButton: ViewModifier {
    var color: Color
    var animationAmount: Double
    func body(content: Content) -> some View {
        content
            .padding(50)
            .background(color)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .frame(maxHeight:.infinity)
            .scaleEffect(animationAmount)
    }
}

extension View {
    func myRoundButton(with color: Color, with animationAmount: Double) -> some View {
        modifier(MyRoundButton(color: color, animationAmount: animationAmount))
    }
}

#Preview {
    ContentView()
}

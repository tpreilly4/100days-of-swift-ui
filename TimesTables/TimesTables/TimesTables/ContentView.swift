//
//  ContentView.swift
//  TimesTables
//
//  Created by Tom Reilly on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var limit = 10
    
    @State private var firstNumber = 6
    @State private var secondNumber = 9
    
    @State private var lastTappedNumber = -1
    
    @State private var numberTapRotation = 0.0

    var actualAnswer: Int {
        return firstNumber * secondNumber
    }
    
    @State private var userAnswer = []
    
    var body: some View {
        VStack {
            Stepper(value: $limit) {
                withAnimation{
                    Text("Multiply up to: \(limit)")
                }
            }
            .transition(.slide)
            .padding()
            .onChange(of: limit) {
                SetupQuestion()
            }
            Text("What is \(firstNumber) * \(secondNumber)?")
                .textCapsuleStyle()
            NumberPad(lastTappedNumber: lastTappedNumber, numberTapRotation: numberTapRotation)
                .onChange(of: lastTappedNumber){
                    print("Hello")
                }
            Text("The answer is\n\(actualAnswer)")
                .textCapsuleStyle()
            Spacer()
        }
        .background(MyGradients.init().linearGrad)
    }
    
    func SetupQuestion(){
        firstNumber = Int.random(in: 0...limit)
        secondNumber = Int.random(in: 0...limit)
    }
}


#Preview {
    ContentView()
}

//
//  ContentView.swift
//  TimesTables
//
//  Created by Tom Reilly on 2/14/24.
//

import SwiftUI

struct NumberPadKey: ViewModifier {
    var rotation: Double
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 100, maxHeight: 100)
            .rotationEffect(.degrees(rotation), anchor: .center)
    }
}

extension View {
    func numberPadKeyStyle(with rotation: Double) -> some View {
        modifier(NumberPadKey(rotation: rotation))
    }
}

struct TextCapsule: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .font(.title)
            .padding()
            .background(.thickMaterial)
            .clipShape(.capsule)
            .padding()
            .multilineTextAlignment(.center)
    }
}

extension View {
    func textCapsuleStyle() -> some View {
        modifier(TextCapsule())
    }
}

struct ContentView: View {
    @State private var limit = 10
    
    @State private var firstNumber = 6
    @State private var secondNumber = 9
    
    @State private var numberTapRotation = 0.0

    var answer: Int {
        print("\(firstNumber) * \(secondNumber) = \(firstNumber * secondNumber)")
        return firstNumber * secondNumber
    }
    
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
            HStack {
                ForEach(1..<4) { number in
                    Image(systemName: "\(number).circle")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .onTapGesture{
                            withAnimation{
                                numberTapRotation += 360
                            }
                        }
                        .rotationEffect(.degrees(numberTapRotation))
                }
            }
            HStack {
                ForEach(4..<7) { number in
                    Image(systemName: "\(number).circle")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .onTapGesture{
                            withAnimation{
                                numberTapRotation += 360
                            }
                        }
                        .rotationEffect(.degrees(numberTapRotation))
                }
            }
            HStack {
                ForEach(7..<10) { number in
                    Image(systemName: "\(number).circle")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .onTapGesture{
                            withAnimation{
                                numberTapRotation += 360
                                print("Tapped \(number)")
                            }
                        }
                        .rotationEffect(.degrees(numberTapRotation))
                }
            }
            HStack{
                Spacer()
                Image(systemName: "\(0).circle")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .onTapGesture{
                        withAnimation{
                            numberTapRotation += 360
                        }
                    }
                    .rotationEffect(.degrees(numberTapRotation))
                Spacer()
            }

            
            Text("The answer is\n\(answer)")
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

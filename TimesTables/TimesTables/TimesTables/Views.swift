//
//  Views.swift
//  TimesTables
//
//  Created by Tom Reilly on 2/15/24.
//

import SwiftUI

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

struct NumberPadKey: View {
    var number: Int
    @State public var lastTappedNumber: Int
    @State public var numberTapRotation: Double
    var body: some View {
        Image(systemName: "\(number).circle")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 100, maxHeight: 100)
            .foregroundStyle(.white)
            .rotationEffect(.degrees(number == lastTappedNumber ? numberTapRotation : 0.0))
            .onTapGesture{
                withAnimation{
                    lastTappedNumber = number
                    numberTapRotation += 360
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation{
                            lastTappedNumber = -1
                            numberTapRotation = 0
                        }
                    }
                }
            }
    }
}

struct NumberPad: View {
    @State public var lastTappedNumber: Int
    @State public var numberTapRotation: Double
    var body: some View {
        ForEach(0..<3) { row in
            HStack{
                ForEach(1..<4) { col in
                    NumberPadKey(number: ((row*3)+col), lastTappedNumber: lastTappedNumber, numberTapRotation: numberTapRotation)
                }
            }
        }
        HStack (alignment: .center){
            NumberPadKey(number: 0, lastTappedNumber: lastTappedNumber, numberTapRotation: numberTapRotation)
        }
    }
}

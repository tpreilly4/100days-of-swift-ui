//
//  MyCustomModifiers.swift
//  ViewsAndModifiers
//
//  Created by Tom Reilly on 2/5/24.
//

import Foundation
import SwiftUI

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

// ViewModifier that uses a property
struct RainbowBox: ViewModifier {
    var thickness: CGFloat
    func body(content: Content) -> some View {
        ZStack{
            Text("🌈")
            content
        }                
        .padding(thickness)
        .background(.clear)
        .padding(thickness)
        .background(.red)
        .padding(thickness)
        .background(.orange)
        .padding(thickness)
        .background(.yellow)
        .padding(thickness)
        .background(.green)
        .padding(thickness)
        .background(.blue)
        .padding(thickness)
        .background(.indigo)
        .padding(thickness)
        .background(.purple)
    }
}

// Extension for RainbowBox that takes an argument and passes it along to the ViewModifier
extension View {
    func rainbowBoxed(with thickness: CGFloat) -> some View {
        modifier(RainbowBox(thickness: thickness))
    }
}

struct BigBlueTitle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.mint)
    }
}

extension View {
    func bigBlueTitleStyle() -> some View {
        modifier(BigBlueTitle())
    }
}

// For RPS, enlarges emojis.
struct GameChoice: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 100))
    }
}

extension View {
    func gameChoiceFontStyle() -> some View {
        modifier(GameChoice())
    }
}

#Preview {
    ContentView()
}

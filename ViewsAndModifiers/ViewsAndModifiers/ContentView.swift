//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tom Reilly on 1/4/24.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .titleStyle()
            CapsuleText(text: "But also")
            Text("Goodbye, world!")
                .titleStyle()
            Button("🔥") {
                print()
            }
        }
        .modifier(RainbowBox(thickness: 5))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MyGradients.init().linearGrad)
    }
}

#Preview {
    ContentView()
}

//
//  ViewModifiers.swift
//  TimesTables
//
//  Created by Tom Reilly on 2/15/24.
//

import SwiftUI

struct CardView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 30)
            .padding(10)
            .background(.ultraThickMaterial)
            .clipShape(.rect(cornerSize: CGSize(width: 5, height: 5)))
            .padding(.horizontal)
    }
}

extension View {
    func cardViewStyle() -> some View {
        modifier(CardView())
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

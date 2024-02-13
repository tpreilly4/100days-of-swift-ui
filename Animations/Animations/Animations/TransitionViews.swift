//
//  TransitionViews.swift
//  Animations
//
//  Created by Tom Reilly on 2/13/24.
//

import SwiftUI

struct TransitionViews: View {
    
    @State private var isShowingRed = false
    @State private var isShowingGreen = false
    @State private var isShowingYellow = false
    
    var body : some View {
        VStack{
            VStack {
                Button("Tap Me") {
                    withAnimation {
                        isShowingRed.toggle()
                    }
                }
                .foregroundColor(.red)
                .padding()
                
                Button("Tap Me") {
                    withAnimation {
                        isShowingGreen.toggle()
                    }
                }
                .foregroundColor(.green)
                .padding()
                
                Text("Tap me")
                    .foregroundStyle(.yellow)
                    .padding()
                    .onTapGesture {
                        withAnimation {
                            isShowingYellow.toggle()
                        }
                    }
            }
            Spacer()
            VStack {
                if isShowingRed{
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
                if isShowingGreen{
                    Rectangle()
                        .fill(.green)
                        .frame(width: 200, height: 200)
                        .transition(.pivot)
                }                
                
                if isShowingYellow{
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 200, height: 200)
                        .transition(.slide)
                        .clipShape(.ellipse)
                }
            }
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

#Preview {
    TransitionViews()
}

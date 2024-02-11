//
//  Part2View.swift
//  Animations
//
//  Created by Tom Reilly on 2/11/24.
//

import SwiftUI

struct Part2View: View {
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero

    let letters = Array("Hello SwiftUI")

    var body: some View {
        VStack{
            Button("Hello") {
                enabled.toggle()
            }
            .frame(width: 150, height: 100)
            .background(enabled ? .mint : .red)
            .animation(nil, value: enabled)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 5))
            .animation(.bouncy(duration: 1), value: enabled)
            Spacer()
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(.rect(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged{ dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation(.bouncy) {
                                dragAmount = .zero
                            }
                        }
                )
            Spacer()
            HStack(spacing: 0) {
                        ForEach(0..<letters.count, id: \.self) { num in
                            Text(String(letters[num]))
                                .padding(5)
                                .font(.title)
                                .background(enabled ? .blue : .red)
                                .offset(dragAmount)
                                .animation(.linear.delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                            .onEnded { _ in
                                dragAmount = .zero
                                enabled.toggle()
                            }
                    )
            

        }
    }
}



#Preview {
    Part2View()
}

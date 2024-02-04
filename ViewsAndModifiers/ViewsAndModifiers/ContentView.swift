//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tom Reilly on 1/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Hello, world!") {
                // do nothing
            }
            .frame(width: 200, height: 200)
        }
        .background(.red)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}

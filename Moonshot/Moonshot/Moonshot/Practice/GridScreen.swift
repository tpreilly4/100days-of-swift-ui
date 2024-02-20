//
//  GridScreen.swift
//  Moonshot
//
//  Created by Tom Reilly on 2/18/24.
//

import SwiftUI

struct GridScreen: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 80)),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    GridScreen()
}

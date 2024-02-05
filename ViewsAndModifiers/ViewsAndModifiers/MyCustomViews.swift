//
//  MyCustomViews.swift
//  ViewsAndModifiers
//
//  Created by Tom Reilly on 2/5/24.
//

import Foundation
import SwiftUI

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.ultraThinMaterial)
            .clipShape(.capsule)
    }
}

//
//  UserDefaultsView.swift
//  iExpense
//
//  Created by Tom Reilly on 2/17/24.
//

import SwiftUI

struct UserDefaultsView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("otherTapCount") private var otherTapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }        
        
        Button("Other tap count: \(otherTapCount)") {
            otherTapCount += 1
        }
    }
}

#Preview {
    UserDefaultsView()
}

//
//  PracticeView.swift
//  Bookworm
//
//  Created by Tom Reilly on 3/27/24.
//

import SwiftUI

struct PracticeView: View {
    @State private var rememberMe = false
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        VStack {
            // Testing @Binding in external views
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
            // Checking out multiline text field. Not TextEditor
            TextField("Enter your text", text: $notes, axis: .horizontal)
                            .textFieldStyle(.roundedBorder)
                            .navigationTitle("Notes")
                            .padding()
        }
        .padding()
    }
}

#Preview {
    PracticeView()
}

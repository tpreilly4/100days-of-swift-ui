//
//  ContentView.swift
//  iExpense
//
//  Created by Tom Reilly on 2/15/24.
//

import SwiftUI
import Observation

@Observable
class User : Codable {
    var firstName = "Bilbo"
    var lastName = "Baggins"
    var helloIcon = "sun.haze.circle"
    var goodbyeIcon = "moon.haze.circle"
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let user: User

    var body: some View {
        Image(systemName: user.goodbyeIcon)
            .imageScale(.large)
            .foregroundStyle(.tint)
            .padding()
        Text("Goodbye, \(user.firstName) \(user.lastName)!")
            .onTapGesture {
                dismiss()
            }
        
        Button("Retrieve User") {
            let decoder = JSONDecoder()
            let userData = UserDefaults.standard.object(forKey: "UserData")
            if let data = try? decoder.decode(User.self, from: userData) {
                print(data)
            }
        }
    }
}

struct ContentView: View {
    @State private var user = User()
    @State private var showingSecondView = false
    
    var body: some View {
        VStack {
            Image(systemName: user.helloIcon)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            Text("Hello, \(user.firstName) \(user.lastName)!")
                .onTapGesture {
                    showingSecondView.toggle()
                }
            
            Button("Save User") {
                let encoder = JSONEncoder()

                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
        }
        .padding()
        .sheet(isPresented: $showingSecondView) {
            SecondView(user: user)
        }
    }
}

#Preview {
    ContentView()
}

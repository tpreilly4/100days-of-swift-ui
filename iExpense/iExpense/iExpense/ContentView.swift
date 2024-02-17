//
//  ContentView.swift
//  iExpense
//
//  Created by Tom Reilly on 2/15/24.
//

import SwiftUI
import Observation

struct User : Codable {
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
                var encodedData : Data = Data()
                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                    encodedData = data
                }
                
                let decoder = JSONDecoder()
                //var userData = UserDefaults.standard.object(forKey: "UserData")
                if let decodeddata = try? decoder.decode(User.self, from: encodedData) {
                    print(decodeddata)
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

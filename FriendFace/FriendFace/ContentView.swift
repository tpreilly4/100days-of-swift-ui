//
//  ContentView.swift
//  FriendFace
//
//  Created by Tom Reilly on 10/22/24.
//

import SwiftUI

struct Response: Codable {
    var results: [User]
}

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                VStack{
                    HStack{
                        Text(user.name)
                        Spacer()
                        if user.isActive {
                            Image(systemName: "waveform")
                                .foregroundStyle(.green)
                        } else {
                            Image(systemName: "powersleep")
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
            } else {
                print("Unable to decode user data")
            }
        } catch {
            print("There was a problem decoding the incoming data")
        }
    }
}

#Preview {
    //ContentView()
}

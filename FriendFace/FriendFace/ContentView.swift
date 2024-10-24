//
//  ContentView.swift
//  FriendFace
//
//  Created by Tom Reilly on 10/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //@State private var users = [User]()
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink {
                    UserView(user: user)
                } label : {
                    UserListItemView(user: user)
                }
            }

            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        if !users.isEmpty {
            print("We already got dat data.")
            return
        }

        print("GETTIN DAT DATA.")
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                for user in decodedResponse {
                    modelContext.insert(user)
                }
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



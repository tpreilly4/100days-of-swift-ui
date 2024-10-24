//
//  UserView.swift
//  FriendFace
//
//  Created by Tom Reilly on 10/22/24.
//

import SwiftUI
import SwiftData

struct UserView: View {
    @Environment(\.modelContext) var modelContext
    @Query var friends: [User]

    let user: User
    
    init(user: User) {
        self.user = user
        let friendIds = user.friends.map { $0.id }
        _friends = Query(filter: #Predicate<User> { friend in
            friendIds.contains(friend.id)
        })
    }
    
    var body: some View {
        NavigationStack{
            UserListItemView(user: user)
                .padding()
            Text("About \(user.name)")
                .font(.headline)
            ScrollView {
                Text(user.about)
                    .padding()
            }
            .frame(maxHeight: 200)
            Form {
                Section("Company") {
                    Text(user.company)
                }
                Section("Email") {
                    Text(user.email)
                }
                Section("Street Address") {
                    Text(user.address)
                }
                Section("Age") {
                    Text(String(user.age))
                }
                Section("Registered") {
                    Text(user.registered.formatted())
                }
                Section("Tags") {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }
                Section("Friends") {
                    ForEach(friends) { friend in
                        NavigationLink {
                            UserView(user: friend)
                        } label : {
                            UserListItemView(user: friend)
                        }
                    }
                }
            }
            .listSectionSpacing(0)
        }
    }
}

#Preview {
    //UserView(user: User.defaultUser)
}

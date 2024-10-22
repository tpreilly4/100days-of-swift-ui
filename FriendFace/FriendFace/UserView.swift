//
//  UserView.swift
//  FriendFace
//
//  Created by Tom Reilly on 10/22/24.
//

import SwiftUI

struct UserView: View {
    let user: User
    
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
                    Text(user.registered)
                }
                Section("Tags") {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }
                Section("Friends") {
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
            }
            .listSectionSpacing(0)
        }
    }
}

#Preview {
    UserView(user: User.defaultUser)
}

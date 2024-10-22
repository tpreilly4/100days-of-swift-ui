//
//  UserListItemView.swift
//  FriendFace
//
//  Created by Tom Reilly on 10/22/24.
//
import SwiftUI

struct UserListItemView: View {
    let user: User
    var body: some View {
        HStack{
            if user.isActive {
                Image(systemName: "waveform")
                    .foregroundStyle(.green)
                    .frame(minWidth: 30)
            } else {
                Image(systemName: "powersleep")
                    .foregroundStyle(.gray)
                    .frame(minWidth: 30)
            }
            Text(user.name)
        }
    }
}

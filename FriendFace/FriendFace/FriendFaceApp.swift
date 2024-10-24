//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Tom Reilly on 10/22/24.
//

import SwiftUI
import SwiftData

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}

//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Tom Reilly on 3/28/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}

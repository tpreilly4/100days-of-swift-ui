//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Tom Reilly on 3/26/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}

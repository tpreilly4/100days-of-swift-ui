//
//  PartOneView.swift
//  NavigationTechniques
//
//  How does swift use NavigationLink?
//  How is the navigationDestination modifier better in many cases?
//  How does navigationDestination work with values that conform to the Hashable protocol?
//
//  Created by Tom Reilly on 2/22/24.
//

import SwiftUI

struct PartOneView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                if (i % 2 == 0) {
                    NavigationLink("Select \(i)", value: i)
                } else {
                    NavigationLink("Select \(i)", value: "\(i)")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected an int, \(selection)")
            }            
            .navigationDestination(for: String.self) { selection in
                Text("You selected a string, \"\(selection)\"")
            }
            .navigationTitle("Strings are odd #'s")
        }
    }
}

#Preview {
    PartOneView()
}

//
//  PartTwoView.swift
//  NavigationTechniques
//
//  Created by Tom Reilly on 2/22/24.
//

import SwiftUI

struct PartTwoView: View {
    //@State private var path = NavigationPath()
    @State private var pathStore = PathStore()

    var body: some View {
        VStack{
            NavigationStack(path: $pathStore.path) {
                List(0..<20) { i in
                    if (i % 2 == 0) {
                        Button("Select \(i)") {
                            pathStore.path.append(i)
                        }
                    } else {
                        NavigationLink("Select \(i)", value: "\(i)")
                    }
                }
                .navigationDestination(for: Int.self) { selection in
                    DetailView(number: selection)
                }
                .navigationDestination(for: String.self) { selection in
                    Text("You selected a string, \"\(selection)\"")
                }
                .navigationTitle("Strings are odd #'s")
            }
            Button("Try this") {
                pathStore.path.append(55)
            }
        }
    }
}

#Preview {
    PartTwoView()
}

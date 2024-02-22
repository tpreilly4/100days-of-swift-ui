//
//  PartThreeView.swift
//  NavigationTechniques
//
//  Created by Tom Reilly on 2/22/24.
//

import SwiftUI

struct PartThreeView: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        VStack{
            NavigationStack {
                List(0..<100) { i in
                    Text("Row \(i)")
                }
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.dark)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action here
                        }

                        Button("Tap Me 2") {
                            // button action here
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PartThreeView()
}

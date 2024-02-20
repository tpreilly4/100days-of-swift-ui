//
//  MoonshotHome.swift
//  Moonshot
//
//  Created by Tom Reilly on 2/18/24.
//

import SwiftUI

struct MoonshotHome: View {
    @State private var showGrid = true
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let gridLayout = [
        GridItem(.adaptive(minimum: 150)),
    ]
    var body: some View {
        NavigationStack {
            if (showGrid) {
                MoonshotHomeGrid(astronauts: astronauts, missions: missions)
                    .toolbar{
                        Button("Switch to List"){
                            showGrid.toggle()
                        }
                    }
            } else {
                MoonshotHomeList(astronauts: astronauts, missions: missions)
                    .toolbar{
                        Button("Switch to Grid"){
                            showGrid.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    MoonshotHome()
}

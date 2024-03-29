//
//  MoonshotHomeGrid.swift
//  Moonshot
//
//  Created by Tom Reilly on 2/20/24.
//

import SwiftUI

struct MoonshotHomeGrid: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    let gridLayout = [
        GridItem(.adaptive(minimum: 150)),
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridLayout) {
                ForEach(missions) { mission in
                    NavigationLink (value: mission) {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack{
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground))
                        .padding(5)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .navigationTitle("Moonshot")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
        .navigationDestination(for: Mission.self) { m in
            MissionView(mission: m, astronauts: astronauts)
        }
    }
}


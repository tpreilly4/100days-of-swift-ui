//
//  AstronautCardView.swift
//  Moonshot
//
//  Created by Tom Reilly on 2/20/24.
//

import SwiftUI

struct AstronautCardView: View {
    let highlightedRole: String = "Commander"
    var crewMember: CrewMember
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(.capsule)
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .foregroundStyle(crewMember.role == highlightedRole ? .indigo : .white)
                    .font(.headline)
                Text(crewMember.role)
                    .foregroundStyle(crewMember.role == highlightedRole ? .indigo.opacity(0.5) : .white.opacity(0.5))
            }
        }
        .padding()
        .background(crewMember.role == highlightedRole ? LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom) : LinearGradient(gradient: Gradient(colors: [.clear, .clear]), startPoint: .top, endPoint: .bottom))
        .clipShape(.rect(cornerRadius: 10))
    }
}

//#Preview {
//    AstronautCardView()
//}

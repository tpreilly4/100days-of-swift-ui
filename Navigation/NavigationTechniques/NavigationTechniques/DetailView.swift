//
//  DetailView.swift
//  NavigationTechniques
//
//  Created by Tom Reilly on 2/22/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    //@Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            
    }
}

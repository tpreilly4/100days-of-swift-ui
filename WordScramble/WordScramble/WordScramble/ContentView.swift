//
//  ContentView.swift
//  WordScramble
//
//  Created by Tom Reilly on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    let people = ["Tom", "Emma", "Otis", "Frank"]
        
    var body: some View {
        VStack {
            List (people, id: \.self) { person in
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.mint)
                    Text("Hello, \(person)!")
                }
            }
            Button("Get the file"){
                getFile()
            }
        }
    }
    
    func getFile() {
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            print(fileURL)
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
                let allTheWords = fileContents.components(separatedBy: "\n")
                print(allTheWords.randomElement())
            }
        }
    }
}

#Preview {
    ContentView()
}

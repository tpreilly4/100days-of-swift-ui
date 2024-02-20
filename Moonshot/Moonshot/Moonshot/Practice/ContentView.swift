//
//  ContentView.swift
//  Moonshot
//
//  Created by Tom Reilly on 2/18/24.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ScrollView (.vertical) {
                Button("Decode JSON") {
                    let input = """
                    {
                        "name": "Taylor Swift",
                        "address": {
                            "street": "555, Taylor Swift Avenue",
                            "city": "Nashville"
                        }
                    }
                    """

                    let data = Data(input.utf8)
                    let decoder = JSONDecoder()
                    if let user = try? decoder.decode(User.self, from: data) {
                        print(user.address.street)
                    }
                }
                NavigationLink {
                    NavigationStack{
                        Image(.ogre)
                    }
                    .navigationTitle("One big ogre")
                } label : {
                    ZStack{
                        Image(.ogre)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .clipShape(.circle)
                        Text("Tap ME!")
                            .foregroundStyle(.mint)
                    }
                }
                VStack(spacing: 10) {
                    ForEach(0..<10) { row in
                        NavigationLink("Row \(row)") {
                            Text("Ogre number \(row)!")
                            Image(.ogre)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .navigationTitle("Ogres")
            }
        }
    }
}


#Preview {
    ContentView()
}

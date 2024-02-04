//
//  MyForm.swift
//  WeSplit
//
//  Created by Tom Reilly on 12/22/23.
//

import SwiftUI

struct MyForm: View {
    let gradient = UnitPoint(x: 0.5, y: 0.5)

    @State private var bananaCounter = "🍌"
    @State var monkeyCounter = "🐒"
    @State private var userEmojis = ""
//    private var madFaceIsVisible: Bool {
//        for c in self.userEmojis{
//            var scalar = Unicode.Scalar(c)
//            if scalar.properties.isEmoji{
//               return true;
//          }
//       }
//    }
    @State var monkeys = ["Orangutan", "Gorilla", "Bonobo", "Gorilla"]
    @State private var selectedMonkey = "Orangutan"
    @State private var showingAlert = false
    @State private var newMonkey = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    Button("Tap me"){
                        // appends a banana
                        self.bananaCounter = "\(self.bananaCounter)🍌"
                    }.foregroundStyle(AngularGradient(colors: [Color.brown, Color.yellow], center: gradient))
                    Text(bananaCounter)
                }
                Section{
                    TextField("Enter some words", text: $userEmojis)
                    Text(userEmojis)
                }
                Section{
                    HStack{
                        Picker("Select your monkey", selection: $selectedMonkey) {
                            ForEach(monkeys, id: \.self) {
                                Text($0)
                            }
                        }
                        Image(systemName: "plus.app")
                            .padding(.leading, 5)
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                            .onTapGesture{
                                showingAlert = true
                            }
                        .alert("Add a new monkey", isPresented: $showingAlert) {
                            TextField("Enter a monkey", text: $newMonkey)
                            Button("Add", action: appendMonkey)
                            Button("Cancel", role: .cancel) { }
                        }
                    }

                }
            }.navigationTitle("Bananas")
            
        }
    }
    
    func appendMonkey() {
        self.monkeys.append(newMonkey)
        selectedMonkey = newMonkey
        newMonkey = ""
    }
}

#Preview {
    MyForm()
}

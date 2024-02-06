//
//  ContentView.swift
//  RPS
//
//  Created by Tom Reilly on 2/5/24.
//

import SwiftUI


let choices = ["🪨","📄","✂️"]

struct ContentView: View {

    @State private var opponentIsVisible = false
    @State private var opponentChoice = Int.random(in: 0..<3)
    @State private var userChoice = 0
    @State private var score = 0
    
    func userChoiceTapped(choice: Int)  {
        userChoice = choice
        print("User chose \(choices[choice])")
    }
    
    func shoot() {
        print(calculateWinner(user: userChoice, opponent: opponentChoice))
        opponentIsVisible = true
        resetGame()
    }
    
    func resetGame(){
        ///opponentIsVisible = false
        opponentChoice = Int.random(in: 0..<3)
    }
    
    func calculateWinner(user: Int, opponent: Int) -> String {
        if user == opponent {
            return "It's a draw!"
        }
        
        if user == 0 {
            if opponent == 1 {
                score -= 1
                return "You lose!"
            } else if opponent == 2 {
                score += 1
                return "You win!"
            }
        } else if user == 1 {
            if opponent == 0 {
                score += 1
                return "You win!"
            } else if opponent == 2 {
                score -= 1
                return "You lose!"
            }
        } else if user == 2 {
            if opponent == 0 {
                score -= 1
                return "You lose!"
            } else if opponent == 1 {
                score += 1
                return "You win!"
            }
        }
        return "Something went wrong!"
    }
    
    var body: some View {
        VStack {
            ZStack{
                Text(choices[opponentChoice])
                    .gameChoiceFontStyle()
                    .opacity(opponentIsVisible ? 1.0 : 0.0)
                Text("Shoot!")
                    .font(.title)
                    .opacity(opponentIsVisible ? 0.0 : 1.0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack{
                
                Text("Choose your weapon.").padding()
                HStack(alignment: .bottom) {
                    ForEach(0..<3) { choice in
                        Button { userChoiceTapped(choice: choice) }
                        label : {
                            Text(choices[choice])
                                .gameChoiceFontStyle()
                                .frame(maxWidth: .infinity, minHeight: 150)
                                .rotationEffect(.degrees(180))
                                .background(choices[choice] == choices[userChoice] ? Material.ultraThickMaterial : Material.ultraThinMaterial)
                                .cornerRadius(10)
                        }
                    }
                }
                Text("Your score: \(score)")
                    .padding()
                Button("Shoot!") {
                    shoot()
                }
                .padding()
                .background(.yellow)
                .clipShape(Capsule())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(MyGradients.init().linearGrad)
    }
}

#Preview {
    ContentView()
}

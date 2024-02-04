//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tom Reilly on 12/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var showingGameOver = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var scoreNumber = 0
    @State private var turns = 0
    
    var body: some View {
        ZStack{
            MyGradients.init().radialOtherGrad
            VStack(spacing: 30){
                Text("Guess the Flag!")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack{
                        Text("Tap the flag of:")
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.secondary)
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        }
                        label : {
                            Image(countries[number].lowercased())
                                .clipShape(.buttonBorder)
                                .shadow(radius: 7)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Text(scoreMessage)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .transition(.slide)
            }
        }
        .ignoresSafeArea()
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: resetQuestion)
        } message: {
            Text(scoreMessage)
        }
        .alert("Game over!", isPresented: $showingGameOver) {
            Button("Play Again?", action: resetGame)
        } message : {
            Text(scoreMessage)
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreNumber += 1
            scoreTitle = "Correct! 🥳"
        } else {
            scoreTitle = "Wrong. That's the flag of \(countries[number])!\n😢"
        }
        
        if turns < 7 {
            scoreMessage = "Your score is: \(scoreNumber)"
            showingScore = true
        } else {
            scoreMessage = "Your final score is: \(scoreNumber)"
            showingGameOver = true
        }
    }
    
    func resetQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        turns += 1
    }
    
    func resetGame() {
        scoreNumber = 0
        turns = 0
        scoreMessage = ""
        resetQuestion()
    }
}

#Preview {
    ContentView()
}

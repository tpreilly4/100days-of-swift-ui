//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tom Reilly on 12/29/23.
//

import SwiftUI

struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(.buttonBorder)
            .shadow(radius: 7)
    }
}

extension View {
    func flagImageStyle() -> some View {
        modifier(FlagImage())
    }
}

struct CorrectChoiceAnimation: ViewModifier {
    var rotationDegrees: Double
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(rotationDegrees), anchor:(.center))
    }
}

extension View {
    func correctChoiceAnimation(with rotation: Double) -> some View {
        modifier(CorrectChoiceAnimation(rotationDegrees: rotation))
    }
}

struct IncorrectChoiceAnimation: ViewModifier {
    var opacity: Double
    var scale: Double
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .scaleEffect(x:scale, y:scale)
    }
}

extension View {
    func incorrectChoiceAnimation(with opacity: Double, with scale: Double) -> some View {
        modifier(IncorrectChoiceAnimation(opacity: opacity, scale: scale))
    }
}

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var showingGameOver = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var scoreNumber = 0
    @State private var turns = 0
    
    // animations
    @State private var flagTapRotation = 0.0
    @State private var flagTapOpacity = 1.0
    @State private var flagTapScale = 1.0
    
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
                        if number == correctAnswer {
                            Button {
                                withAnimation {
                                    if flagTapped(number) {
                                        flagTapRotation += 360
                                        flagTapOpacity -= 0.75
                                    }
                                }
                            }
                            label : {
                                Image(countries[number].lowercased())
                                    .flagImageStyle()
                                    .correctChoiceAnimation(with: flagTapRotation)
                            }
                        }
                        else {
                            Button {
                                withAnimation {
                                    if !flagTapped(number) {
                                        flagTapOpacity -= 0.75
                                        flagTapScale -= 0.25
                                    }
                                }
                            }
                            label : {
                                Image(countries[number].lowercased())
                                    .flagImageStyle()
                                    .incorrectChoiceAnimation(with: flagTapOpacity, with: flagTapScale)
                            }
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
    
    func flagTapped(_ number: Int) -> Bool {
        if number == correctAnswer {
            scoreNumber += 1
            scoreTitle = "Correct! 🥳"
            updateScore()
            return true
        } else {
            scoreTitle = "Wrong. That's the flag of \(countries[number])!\n😢"
            updateScore()
            return false
        }
    }
    
    func updateScore() {
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
        flagTapOpacity = 1.0
        flagTapScale = 1.0
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

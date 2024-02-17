//
//  ContentView.swift
//  TimesTables
//
//  Created by Tom Reilly on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var answer = ""
    var questionNumberChoices = [5,10,20]
    @State private var limit = 10
    @State private var numberOfQuestions = 10
    @State private var showingForm = true
    @State private var showingQuestions = false
    @State private var questionsList : [Question] = []
    @State private var answersList : [String] = []
    
    @State private var firstNumber = 6
    @State private var secondNumber = 9
    
    @State private var lastTappedNumber = -1
    
    @State private var numberTapRotation = 0.0

    var actualAnswer: Int {
        return firstNumber * secondNumber
    }
    
    @State private var userAnswer = []
    
    var body: some View {
        NavigationStack{
            VStack{
                if showingForm {
                    VStack{
                        HStack{
                            Text("How many questions?")
                            Spacer()
                            Picker("", selection: $numberOfQuestions){
                                ForEach(questionNumberChoices, id: \.self) {
                                    Text("\($0) Questions")
                                }
                            }
                        }
                        .cardViewStyle()
                        Stepper(value: $limit, in: 1...15) {
                            Text("With numbers up to: \(limit)")
                        }
                        .cardViewStyle()
                        Button("Generate Questions"){
                            questionsList = GenerateAllQuestions()
                            withAnimation{
                                showingForm.toggle()
                                showingQuestions.toggle()
                            }
                        }
                        .cardViewStyle()
                    }
                    .padding(.top)
                    .transition(.slide)
                }
                
                Spacer()
                
                if showingQuestions {
                    VStack{
                        Button("Done!") {
                            withAnimation{
                                showingForm.toggle()
                                showingQuestions.toggle()
                            }
                        }
                        List{
                            ForEach(questionsList, id: \.self) { q in
                                Section("\(q.title)"){
                                    TextField("What is \(q.firstNumber) * \(q.secondNumber)?", text:$answer)
                                }
                            }
                            .listRowBackground(Color.white)
                        }
                        .listSectionSpacing(.leastNonzeroMagnitude)
                        .scrollContentBackground(.hidden)
                    }
                    .transition(.slide)
                }
            }
            .frame(maxHeight: .infinity)
            .background(MyGradients.init().linearGrad)
            .navigationTitle("Practice Multiplication!")
        }
    }
    
    func GenerateAllQuestions() -> [Question] {
        var questions : [Question] = []
        for num in 0...Int(numberOfQuestions) {
            let first = Int.random(in: 0...limit)
            let second = Int.random(in: 0...limit)
            questions.append(Question(questionNumber: num, firstNumber: first, secondNumber: second))
        }
        return questions
    }
}

struct Question : Hashable {
    var userAnswer: String = "\(0)"
    var questionNumber: Int
    var firstNumber: Int
    var secondNumber: Int
    var title: String {
        "Question \(self.questionNumber + 1)"
    }
    var answer : Int {
        self.firstNumber * self.secondNumber
    }
}


#Preview {
    ContentView()
}

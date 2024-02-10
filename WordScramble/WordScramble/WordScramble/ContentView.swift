//
//  ContentView.swift
//  WordScramble
//
//  Created by Tom Reilly on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0

    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
        
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .onSubmit(addNewWord)
                        .onAppear(perform: getFile)
                        .alert(errorTitle, isPresented: $showingError) { } message: {
                            Text(errorMessage)
                        }                        
                        .textInputAutocapitalization(.never)
                    Button("Add") {
                        addNewWord()
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                Section {
                    Text("Your score: \(score)")
                        .font(.headline)
                }
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar{
                ToolbarItem(placement: .automatic) {
                    Button("Restart") {
                        restartGame()
                    }
                }
            }
        }
    }
    func restartGame(){
        usedWords = [String]()
        rootWord = ""
        newWord = ""
        score = 0
        
        getFile()
    }
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func addNewWord() {
        guard newWord.count > 0 else { return }
        newWord = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard newWord.count > 2 else {
            wordError(title: "Word too short", message: "Words should be at least 3 characters long!")
            return
        }
        
        guard newWord != rootWord else {
            wordError(title: "You just used the starting word", message: "Nice try, dick!")
            return
        }
        
        guard isOriginal(word: newWord) else {
            wordError(title: "Word used already", message: "Be more original.")
            return
        }

        guard isPossible(word: newWord) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: newWord) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(newWord, at :0)
        }
        score += newWord.count
        newWord = ""
    }
    
    func getFile() {
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
                let allTheWords = fileContents.components(separatedBy: "\n")
                rootWord = allTheWords.randomElement() ?? "silkworm"
                print(rootWord)
                return
            }
        }
        
        fatalError("Could not load start.txt from app bundle.")
    }
}

#Preview {
    ContentView()
}

//
//  AddNewHabit.swift
//  Habitude
//
//  Created by Tom Reilly on 2/26/24.
//

import SwiftUI

struct AddHabitView: View {
    @State private var showingValidationAlert = false
    @State private var name = ""
    @State private var description = ""
    @Binding var habits : UserHabits
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Habit Name", text: $name)
                TextField("Description", text: $description)
            }
            .toolbar() {
                Button("Save") {
                    saveNewHabit()
                }
                .disabled(name.isEmpty)
            }
            .navigationTitle("New Habit")
            .alert("Missing info", isPresented: $showingValidationAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
    func saveNewHabit() {
        guard !name.isEmpty else {
            showingValidationAlert = true;
            return;
        }
        
        habits.contents.append(Habit(name: name, description: description))
        dismiss()
    }
}

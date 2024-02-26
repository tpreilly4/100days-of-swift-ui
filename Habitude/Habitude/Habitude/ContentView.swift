//
//  ContentView.swift
//  Habitude
//
//  Created by Tom Reilly on 2/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var habits = UserHabits()
    
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.contents) { habit in
                    VStack{
                        NavigationLink(habit.name) {
                            HabitDetailsView(habit: habit)
                        }
                        .font(.title)
                        .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.mint, .green]), startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(15)
                }
                .onDelete(perform: removeHabit)
                .listRowSeparator(.hidden)
            }
            
            .listStyle(.inset)
            .sheet(isPresented: $showingAddSheet) {
                AddHabitView(habits: $habits)
            }
            .toolbar {
                Button {
                    showingAddSheet.toggle()
                } label : {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("Habitude")
        }
    }
    
    func removeHabit (at offsets: IndexSet) {
        habits.contents.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

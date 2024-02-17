//
//  OnDeleteView.swift
//  iExpense
//
//  Created by Tom Reilly on 2/17/24.
//

import SwiftUI

struct OnDeleteView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar{
                EditButton()
            }
            .navigationTitle("Add/Delete Numbers")
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    OnDeleteView()
}

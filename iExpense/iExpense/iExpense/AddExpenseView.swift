//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Tom Reilly on 2/17/24.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var expenses: Expenses
    
    @State private var name = "Enter Expense Name"
    @State private var category = "Personal"
    @State private var amount = 0.0

    let categories = ["Business", "Personal"]

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $category) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, category: category, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

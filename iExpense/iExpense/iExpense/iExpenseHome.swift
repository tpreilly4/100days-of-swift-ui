//
//  iExpenseHome.swift
//  iExpense
//
//  Created by Tom Reilly on 2/17/24.
//

import SwiftUI

struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name: String
    let category: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey:"Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct iExpenseHome: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body : some View {
        NavigationStack{
            List{
                Section ("Personal Expenses") {
                    ForEach(expenses.items) { item in
                        if item.category == "Personal" {
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.category)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundStyle(amountColorChooser(amt: item.amount))
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }                
                Section ("Business Expenses") {
                    ForEach(expenses.items) { item in
                        if item.category == "Business" {
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.category)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundStyle(amountColorChooser(amt: item.amount))
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddExpenseView(expenses: expenses)
            }
        }
    }
    
    func amountColorChooser(amt: Double) -> Color {
        if amt < 10 {
            return Color.green
        } else if amt < 100 {
            return Color.orange
        } else {
            return Color.red
        }
        
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


#Preview{
    iExpenseHome()
}

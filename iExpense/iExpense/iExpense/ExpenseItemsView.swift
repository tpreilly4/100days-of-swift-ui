//
//  ExpenseItemsView.swift
//  iExpense
//
//  Created by Tom Reilly on 10/18/24.
//

import SwiftUI
import SwiftData

struct ExpenseItemsView: View {
    @Query var expenses: [ExpenseItem]
    @Environment(\.modelContext) var modelContext

    init(sortType: [SortDescriptor<ExpenseItem>], filterType: String) {
        _expenses = Query(filter: #Predicate<ExpenseItem> { expense in
            expense.category == filterType || filterType == "All"
        }, sort: sortType)
    }
    
    var body: some View {
        List{
            ForEach(expenses) { item in
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
            .onDelete(perform: removeItems)
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
        for index in offsets {
            let expense = expenses[index]
            modelContext.delete(expense)
        }
    }
    
}


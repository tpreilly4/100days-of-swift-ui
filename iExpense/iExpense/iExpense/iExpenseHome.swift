//
//  iExpenseHome.swift
//  iExpense
//
//  Created by Tom Reilly on 2/17/24.
//

import SwiftUI
import SwiftData

struct iExpenseHome: View {
    @Query var expenses: [ExpenseItem]
    @Environment(\.modelContext) var modelContext
    
    @State private var showingAddExpense = false
    
    @State private var sortType = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    @State private var filterType = "All"
    
    var body : some View {
        NavigationStack{
            VStack{
                ExpenseItemsView(sortType: sortType, filterType: filterType)
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink(destination: AddExpenseView()) {
                    Image(systemName: "plus")
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort By", selection: $sortType) {
                        Text("Name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount)
                            ])
                        Text("Amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ])
                    }
                }
                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle"){
                    Picker("Sort By", selection: $filterType) {
                        Text("Business")
                            .tag("Business")
                        Text("Personal")
                            .tag("Personal")
                        Text("All")
                            .tag("All")
                    }
                }
            }
        }
    }
}


#Preview{
    iExpenseHome()
}

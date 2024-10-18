//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Tom Reilly on 2/15/24.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            iExpenseHome()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}

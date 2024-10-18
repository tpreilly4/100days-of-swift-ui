//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Tom Reilly on 10/17/24.
//

import SwiftUI
import SwiftData

@Model
class ExpenseItem : Identifiable, Hashable {
    var id = UUID()
    var name: String
    var category: String
    var amount: Double
    
    init(id: UUID = UUID(), name: String, category: String, amount: Double) {
        self.id = id
        self.name = name
        self.category = category
        self.amount = amount
    }
}

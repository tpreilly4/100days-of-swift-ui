//
//  UserHabits.swift
//  Habitude
//
//  Created by Tom Reilly on 2/26/24.
//

import SwiftUI

@Observable
class UserHabits {
    var contents = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(contents) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    public init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                contents = decodedHabits
                return
            }
        } else {
            // incorporate UserDefaults
            contents = []
        }
    }
}

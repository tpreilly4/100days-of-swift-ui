//
//  HabitAction.swift
//  Habitude
//
//  Created by Tom Reilly on 2/26/24.
//

import SwiftUI

struct Habit : Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var times = 0
}

//
//  HabitDetailsView.swift
//  Habitude
//
//  Created by Tom Reilly on 2/26/24.
//

import SwiftUI

struct HabitDetailsView: View {
    let habit: Habit
    var body: some View {
        NavigationStack{
            Text(habit.name)
            Text(habit.description)
        }
    }
}

#Preview {
    HabitDetailsView(habit: Habit(name: "Testing", description: "Testing Desc", times: 2))
}

//
//  ContentView.swift
//  BetterRest
//
//  Created by Tom Reilly on 2/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Form {
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 1...24, step: 0.25)
                DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                
                Text(wakeUp, format: .dateTime.day().month().year())
            }
        }
        .padding()
    }
}

func datesAndStuff () {
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components)
}

#Preview {
    ContentView()
}


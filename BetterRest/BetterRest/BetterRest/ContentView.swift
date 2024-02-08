//
//  ContentView.swift
//  BetterRest
//
//  Created by Tom Reilly on 2/7/24.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    @State private var wakeUp = defaultWakeTime
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .frame(maxWidth:.infinity)
                        .datePickerStyle(.wheel)
                        .onChange(of: wakeUp) {
                            calculateBedtime()
                        }
                }
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...16, step: 0.25)
                        .onChange(of: sleepAmount) {
                            calculateBedtime()
                        }
                }
                Section("Daily Coffee Intake") {
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount){
                        ForEach(0..<20){
                            Text("^[\($0) cup](inflect: true)")
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: coffeeAmount) {
                        calculateBedtime()
                    }
                }
                Section(alertTitle){
                    Text(alertMessage)
                        .font(.headline)
                }
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
        }
    }
    
    func calculateBedtime(){
        do {
            // Instantiate model
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            // Convert date to Doubles because thats what the ML model wants (number of seconds)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            // Let the model predict how much sleep you will get
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            // Subtract predicted amount of sleep from time they want to wake up
            let sleepTime = wakeUp - prediction.actualSleep
            
            // Show the user via alert dialog
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

#Preview {
    ContentView()
}


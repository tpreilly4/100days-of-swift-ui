//
//  ContentView.swift
//  UnitConverter
//
//  Created by Tom Reilly on 12/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var timeInput = 0.0
    var timeOutput : Double {
        switch selectedInputUnit{
        case "Seconds":
            switch selectedOutputUnit{
            case "Seconds":
                return timeInput
            case "Minutes":
                return timeInput/60
            case "Hours":
                return timeInput/3600
            case "Days":
                return timeInput/(3600*24)
            default:
                return 0.0
            }
        case "Minutes":
            switch selectedOutputUnit{
            case "Seconds":
                return timeInput*60
            case "Minutes":
                return timeInput
            case "Hours":
                return timeInput/60
            case "Days":
                return timeInput/(60*24)
            default:
                return 0.0
            }
        case "Hours":
            switch selectedOutputUnit{
            case "Seconds":
                return timeInput * 3600
            case "Minutes":
                return timeInput * 60
            case "Hours":
                return timeInput
            case "Days":
                return timeInput / 24
            default:
                return 0.0
            }
        case "Days":
            switch selectedOutputUnit{
            case "Seconds":
                return timeInput*(3600*24)
            case "Minutes":
                return timeInput*3600
            case "Hours":
                return timeInput*24
            case "Days":
                return timeInput
            default:
                return 0.0
            }
        default:
            return 0.0
        }
    }
    
    let unitTypes = ["Seconds", "Minutes", "Hours", "Days"]
    @State var selectedInputUnit = "Seconds"
    @State var selectedOutputUnit = "Seconds"
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Time in") {
                    HStack{
                        TextField("Enter an amount of time", value: $timeInput, format:.number)
                            .keyboardType(.numberPad)
                        Picker("", selection: $selectedInputUnit){
                            ForEach(unitTypes, id: \.self){
                                Text($0)
                            }
                        }
                    }
                }
                Section("Time out") {
                    HStack{
                        Text(timeOutput, format:.number)
                        Picker("", selection: $selectedOutputUnit){
                            ForEach(unitTypes, id: \.self){
                                Text($0)
                            }
                        }
                    }
                }

            }
            .navigationTitle("Time Converter")
        }
        
    }
}

#Preview {
    ContentView()
}

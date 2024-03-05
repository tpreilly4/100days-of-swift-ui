//
//  CupcakeCornerHomeView.swift
//  CupcakeCorner
//
//  Created by Tom Reilly on 3/4/24.
//

import SwiftUI

struct CupcakeCornerHomeView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity)
                }
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink("Delivery Details") {
                        AddressView(order: order)
                    }
                }
            }
        }
    }
}

#Preview {
    CupcakeCornerHomeView()
}

//
//  Overview.swift
//  GuessTheFlag
//
//  Created by Tom Reilly on 12/30/23.
//

import SwiftUI

struct Overview: View {
    
    var linearGrad = LinearGradient(stops: [
        Gradient.Stop(color: .green, location: 0),
        Gradient.Stop(color: .black, location: 1),
    ], startPoint: .top, endPoint: .bottom)
    
    var radGrad = RadialGradient(colors: [.yellow, .black], center: .center, startRadius: 0, endRadius: 500)
    
    var angGrad = AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
    
    @State private var showingAlert = false
    
    var body: some View {
        ZStack{
            angGrad
                .frame(width: 300, height: .infinity)
                .ignoresSafeArea()
            Button("Goodbye", action:executeButton)
                .foregroundStyle(.secondary)
                .padding(50)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
        }
        ZStack {
            radGrad
            VStack {
                Button("Button 1") { }
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive) { }
                    .buttonStyle(.bordered)
                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
                Button { showingAlert = true }
                    label: {
                        Text("Alert!")
                            .background(.purple.gradient)
                            .cornerRadius(5)
                            .padding(5)
                    }
                    .alert("Hey!", isPresented: $showingAlert) {
                        Text("Nice tits")
                        Button("Ok"){}
                        Button("Ok2"){}
                        Button("Ok3"){}
                    } message: {
                        Text("Red")
                        Color.red
                    }
                Button("Edit", systemImage: "pencil") {
                    print("Edit button was tapped")
                }
                Button {
                    print("Edit button was tapped")
                } label: {
                    Label("Edit", systemImage: "pencil")
                        .padding(15)
                        .foregroundStyle(.white)
                        .background(.red)
                        .cornerRadius(10)
                }
            }
            
        }
        .ignoresSafeArea()
    }
    
    func executeButton(){
        
    }
}

#Preview {
    Overview()
}

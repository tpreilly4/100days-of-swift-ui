//
//  MyGradients.swift
//  ViewsAndModifiers
//
//  Created by Tom Reilly on 2/4/24.
//

import Foundation

import SwiftUI

struct MyGradients {
    let linearGrad = LinearGradient(stops: [
        Gradient.Stop(color: .yellow, location: 0),
        Gradient.Stop(color: .mint, location: 1),
        ], startPoint: .top, endPoint: .bottom)
    
    let radialGrad = RadialGradient(stops: [
        .init(color: .blue, location: 0.3),
        .init(color: .red, location: 0.3),
    ], center: .top, startRadius: 200, endRadius: 700)
    
    let radialOtherGrad = RadialGradient(stops: [
        .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
        .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
    ], center: .top, startRadius: 200, endRadius: 400)
}

//
//  CodableConformanceView.swift
//  CupcakeCorner
//
//  Created by Tom Reilly on 3/4/24.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
        case _lastname = "lastname"
    }
    
    var name = "Taylor"
    var lastname = "Swift"
}

struct CodableConformanceView: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }

    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    CodableConformanceView()
}

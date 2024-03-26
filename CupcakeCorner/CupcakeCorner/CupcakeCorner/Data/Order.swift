//
//  Order.swift
//  CupcakeCorner
//
//  Created by Tom Reilly on 3/4/24.
//

import Foundation

@Observable
class Order: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var extraFrosting = false
    var addSprinkles = false
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespaces).isEmpty || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty || city.trimmingCharacters(in: .whitespaces).isEmpty || zip.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }

        return true
    }
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2

        // complicated cakes cost more
        cost += (Decimal(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }

        return cost
    }
}

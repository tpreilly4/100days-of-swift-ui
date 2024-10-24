//
//  User.swift
//  FriendFace
//
//  Created by Tom Reilly on 10/22/24.
//

import Foundation
import SwiftData

@Model
class User: Codable, Identifiable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    enum CodingKeys: CodingKey {
        case id
        case isActive
        case name
        case age
        case company
        case email
        case address
        case about
        case registered
        case tags
        case friends
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // handle conversion from string to UUID
        let stringId = try container.decode(String.self, forKey: .id)
        guard let uuid = UUID(uuidString: stringId) else {
            throw DecodingError.dataCorruptedError(forKey: .id, in: container, debugDescription: "Invalid UUID string")
        }
        self.id = uuid
        
        // handle conversion from string to Date
        let stringRegisteredDate = try container.decode(String.self, forKey: .registered)
        guard let date = ISO8601DateFormatter().date(from: stringRegisteredDate) else {
            throw DecodingError.dataCorruptedError(forKey: .registered, in: container, debugDescription: "Invalid ISO8601 date string")
        }
        self.registered = date
        
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(String.self, forKey: .address)
        self.about = try container.decode(String.self, forKey: .about)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.friends = try container.decode([Friend].self, forKey: .friends)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // Perform conversions needed for uuid -> String & Date -> String
        try container.encode(self.id.uuidString.lowercased(), forKey: .id)
        let isoFormatter = ISO8601DateFormatter()
        try container.encode(isoFormatter.string(from: self.registered), forKey: .registered)
        
        try container.encode(isActive, forKey: .isActive)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(company, forKey: .company)
        try container.encode(email, forKey: .email)
        try container.encode(address, forKey: .address)
        try container.encode(about, forKey: .about)
        try container.encode(tags, forKey: .tags)
        try container.encode(friends, forKey: .friends)
    }
}

//
//  User.swift
//  FriendFace
//
//  Created by Tom Reilly on 10/22/24.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String  // Need to set up custom decoding/encoding as UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String  // Need to set up custom decoding/encoding as Date
    var tags: [String]
    var friends: [Friend]
}

//
//  Friend.swift
//  FriendFace
//
//  Created by Tom Reilly on 10/22/24.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}

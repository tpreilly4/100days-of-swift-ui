//
//  Student.swift
//  Bookworm
//
//  Created by Tom Reilly on 3/27/24.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

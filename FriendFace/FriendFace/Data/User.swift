//
//  User.swift
//  FriendFace
//
//  Created by Tom Reilly on 10/22/24.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
    
    static let defaultUser = User(
        id: "3b121997-457d-42b3-91a7-78aa822dd812",
        isActive: true,
        name: "Tom Reilly",
        age: 29,
        company: "ClockShark",
        email: "tomreilly@clockshark.com",
        address: "120 Neilson Street",
        about: """
        Magna non duis velit qui esse est Lorem dolor elit duis reprehenderit sit enim non. Fugiat aliquip ex quis dolor et officia occaecat aute irure nisi tempor esse. Excepteur occaecat ut est esse pariatur in nostrud Lorem minim incididunt aute. Magna non duis velit qui esse est Lorem dolor elit duis reprehenderit sit enim non. Fugiat aliquip ex quis dolor et officia occaecat aute irure nisi tempor esse. Excepteur occaecat ut est esse pariatur in nostrud Lorem minim incididunt aute. Magna non duis velit qui esse est Lorem dolor elit duis reprehenderit sit enim non. Fugiat aliquip ex quis dolor et officia occaecat aute irure nisi tempor esse. Excepteur occaecat ut est esse pariatur in nostrud Lorem minim incididunt aute.
        """,
        registered: "2015-11-15T05:11:33-00:00",
        tags: [
            "aliquip", "aliquip", "velit", "aliqua", "ad", "magna", "nulla"
        ],
        friends: [
            Friend(id: "ea523efb-0ce5-4892-844e-9d55ce680588", name: "Katharine Lee"),
            Friend(id: "709dd627-900c-48f2-8b12-a42fe2695e31", name: "Humphrey Montoya"),
            Friend(id: "88a7d5d2-0808-4e5a-bff6-a0d122df2c46", name: "Barnett Heath"),
            Friend(id: "f2ec2b87-4eac-444f-94e4-19197e87b7f7", name: "Carmen Dillon")
        ]
    )
}

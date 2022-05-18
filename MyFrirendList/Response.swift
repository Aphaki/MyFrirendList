//
//  Response.swift
//  MyFrirendList
//
//  Created by Sy Lee on 2022/05/16.
//

import Foundation

struct Response: Codable {
    let results: [Friend]
    let info: Info
}
struct Friend: Codable, Identifiable {
    let id = UUID()
    let name: Name
    let phone: String
    let picture: Picture
    let email: String
    private enum CodingKeys: CodingKey {
        case name, phone, picture, email
    }
    static func getDummy() -> Self {
        return Friend(name: Name.getDummy(), phone: "010-1234-5678", picture: Picture.getDummy(), email: "Maru@email.com")
    }
}
struct Name: Codable {
    let title: String
    let first: String
    let last: String
    static func getDummy() -> Self {
        return Name(title: "title", first: "Kim", last: "Koo2")
    }
}
struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
    
    static func getDummy() -> Self {
        return Picture(large: "https://randomuser.me/api/portraits/women/60.jpg",
                       medium: "https://randomuser.me/api/portraits/women/60.jpg",
                       thumbnail: "https://randomuser.me/api/portraits/women/60.jpg")
    }
}
struct Info: Codable {
    let seed: String
    let resultsCount: Int
    let page: Int
    let version: String
    
    private enum CodingKeys: String, CodingKey {
        case seed
        case resultsCount = "results"
        case page
        case version
    }
}

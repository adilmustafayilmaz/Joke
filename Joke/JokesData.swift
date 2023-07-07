//
//  JokesData.swift
//  Joke
//
//  Created by Adil Mustafa Yılmaz on 6.07.2023.
//

import Foundation


// MARK: - Welcome
struct Welcome:Identifiable, Codable {
    let categories: [String]
    let createdAt: String
    let iconURL: String
    let id, updatedAt: String
    let url: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
}

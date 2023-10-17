//
//  Owner.swift
//
//
//  Created by Tibor Felföldy on 2023-10-17.
//

import Foundation

public struct Owner {
    public let login: String
    public let avatarUrl: String
}

extension Owner: Decodable {
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}

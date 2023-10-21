//
//  RepositoryItem.swift
//
//
//  Created by Tibor Felföldy on 2023-10-17.
//

import Foundation
import InitMacro

@Init
public struct RepositoryItem {
    public let name: String
    public let description: String?
    public let owner: Owner
    public let language: String?
    public let numberOfStars: Int
    public let htmlUrl: URL
}

extension RepositoryItem: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, description, owner, language
        case numberOfStars = "stargazers_count"
        case htmlUrl = "html_url"
    }
}

extension RepositoryItem: Identifiable {
    public var id: URL { htmlUrl }
}

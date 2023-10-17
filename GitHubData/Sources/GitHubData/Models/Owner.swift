//
//  Owner.swift
//
//
//  Created by Tibor Felföldy on 2023-10-17.
//

import Foundation
import InitMacro

@Init
public struct Owner {
    public let name: String
    public let avatarUrl: String
}

extension Owner: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatarUrl = "avatar_url"
    }
}

//
//  GitHubRepository.swift
//
//
//  Created by Tibor Felföldy on 2023-10-17.
//

import Foundation

struct SearchRepositoriesResult: Decodable {
    let items: [RepositoryItem]
}

public protocol GitHubRepository {
    func searchRepositories(query: String) async throws -> [RepositoryItem]
}

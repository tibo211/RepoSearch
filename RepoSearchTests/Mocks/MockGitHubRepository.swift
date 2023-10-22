//
//  MockGitHubRepository.swift
//  RepoSearchTests
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import GitHubData
import Foundation
@testable import RepoSearch

struct MockGitHubRepository: GitHubRepository {
    let result: Result<[RepositoryItem], Error>
    
    func searchRepositories(query: String) async throws -> [RepositoryItem] {
        switch result {
        case let .success(items):
            return items
        case let .failure(error):
            throw error
        }
    }
}

extension GitHubRepository where Self == MockGitHubRepository {
    static func mock(returns result: Result<[RepositoryItem], Error>) -> Self {
        MockGitHubRepository(result: result)
    }
}

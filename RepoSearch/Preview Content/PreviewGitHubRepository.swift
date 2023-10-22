//
//  PreviewGitHubRepository.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-22.
//

import GitHubData

struct PreviewGitHubRepository: GitHubRepository {
    func searchRepositories(query: String) async throws -> [RepositoryItem] {
        // Simulate API request.
        try await Task.sleep(for: .seconds(2))
        // Filter previews by name.
        return .previews.filter { repo in
            let content = "\(repo.name)\(repo.description ?? "")\(repo.owner.name)"
            return content.contains(query)
        }
    }
}

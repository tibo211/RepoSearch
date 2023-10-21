//
//  MockGitHubRepository.swift
//  RepoSearchTests
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import GitHubData
import Foundation

struct MockGitHubRepository: GitHubRepository {
    let throwError: Bool
    
    func searchRepositories(query: String) async throws -> [RepositoryItem] {
        if throwError {
            throw URLError(.notConnectedToInternet)
        }
        return [
            RepositoryItem(
                name: "TensorRT-LLM",
                description: "Provides users with an easy-to-use Python API to define Large Language Models (LLMs) and build TensorRT engines...",
                owner: Owner(name: "NVIDIA", avatarUrl: ""),
                language: "C++",
                numberOfStars: 1188,
                htmlUrl: URL(string: "https://github.com/NVIDIA/TensorRT-LLM")!
            ),
        ]
    }
}

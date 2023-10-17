//
//  GitHubRepository.swift
//
//
//  Created by Tibor Felföldy on 2023-10-17.
//

import Foundation

public protocol GitHubRepository {
    func searchRepositories(query: String) async throws -> [RepositoryItem]
}

struct SearchRepositoriesResult: Decodable {
    let items: [RepositoryItem]
}

struct DefaultGitHubRepository: GitHubRepository {
    func searchRepositories(query: String) async throws -> [RepositoryItem] {
        let url: URL = {
            var components = URLComponents(string: "https://api.github.com/search/repositories")!
            components.queryItems = [URLQueryItem(name: "q", value: query)]
            return components.url!
        }()
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(SearchRepositoriesResult.self, from: data)
        
        return result.items
    }
}

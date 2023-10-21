//
//  RepositorySearchViewModel.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import SwiftUI
import GitHubData

@Observable final class RepositorySearchViewModel {
    var searchText = ""
    private(set) var searchResults: [RepositoryItem]? = nil
    
    private let repository: GitHubRepository
    
    init(repository: GitHubRepository = GitHubData.repository) {
        self.repository = repository
    }
    
    func search() async {
        do {
            let results = try await repository.searchRepositories(query: searchText)
            
            await MainActor.run {
                self.searchResults = results
            }
        } catch {
            // TODO: Error handling.
        }
    }
}

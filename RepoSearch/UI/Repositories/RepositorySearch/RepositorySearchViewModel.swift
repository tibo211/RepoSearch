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
    var showError: Error? = nil

    private(set) var searchResults: [RepositoryItem]? = nil

    private let repository: GitHubRepository
    
    init(repository: GitHubRepository = GitHubData.repository) {
        self.repository = repository
    }
    
    func search() async {
        do {
            let results = try await repository.searchRepositories(query: searchText)
            
            await MainActor.run {
                searchResults = results
            }
        } catch {
            await MainActor.run {
                showError = error
            }
        }
    }
}

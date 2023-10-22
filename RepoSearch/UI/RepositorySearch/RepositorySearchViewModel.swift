//
//  RepositorySearchViewModel.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import SwiftUI
import GitHubData

@Observable final class RepositorySearchViewModel {
    var searchText = "" {
        // Remove search results if we clear the text.
        didSet {
            if searchText.isEmpty {
                searchResults = nil
            }
        }
    }

    var showError: Error? = nil

    private(set) var isLoading: Bool = false
    private(set) var searchResults: [RepositoryItem]? = nil

    private let repository: GitHubRepository
    
    init(repository: GitHubRepository = GitHubData.repository) {
        self.repository = repository
    }
    
    func search() async {
        await MainActor.run {
            isLoading = true
        }
        
        do {
            let results = try await repository.searchRepositories(query: searchText)
            
            await MainActor.run {
                isLoading = false
                searchResults = results
            }
        } catch {
            await MainActor.run {
                isLoading = false
                showError = error
            }
        }
    }
}

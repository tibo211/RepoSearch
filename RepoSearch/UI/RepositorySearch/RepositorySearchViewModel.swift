//
//  RepositorySearchViewModel.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import SwiftUI
import GitHubData

enum SearchState: Equatable {
    enum SearchPromptType: Equatable {
        case search
        case noResults(String)
    }
    
    case loading
    case results([RepositoryItem])
    case prompt(SearchPromptType)
}

@Observable final class RepositorySearchViewModel {
    var searchText = "" {
        // Remove search results if we clear the text.
        didSet {
            if searchText.isEmpty {
                searchState = .prompt(.search)
            }
        }
    }

    var showError: Error? = nil

    private(set) var isLoading: Bool = false
    private(set) var searchState: SearchState = .prompt(.search)

    private let repository: GitHubRepository
    
    init(repository: GitHubRepository = GitHubData.repository) {
        self.repository = repository
    }
    
    func search() async {
        await MainActor.run {
            searchState = .loading
        }
        
        do {
            let results = try await repository.searchRepositories(query: searchText)
            
            await MainActor.run {
                searchState = if results.isEmpty {
                    .prompt(.noResults(searchText))
                } else {
                    .results(results)
                }
            }
        } catch {
            await MainActor.run {
                searchState = .prompt(.search)
                showError = error
            }
        }
    }
}

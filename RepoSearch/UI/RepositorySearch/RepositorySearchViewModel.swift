//
//  RepositorySearchViewModel.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import SwiftUI
import GitHubData

@Observable final class RepositorySearchViewModel {
    enum SearchState: Equatable {
        case searchPrompt
        case loading
        case results([RepositoryItem])
        case noResults
    }

    var searchText = "" {
        // Remove search results if we clear the text.
        didSet {
            if searchText.isEmpty {
                searchState = .searchPrompt
            }
        }
    }

    var showError: Error? = nil

    private(set) var isLoading: Bool = false
    private(set) var searchState: SearchState = .searchPrompt

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
                searchState = results.isEmpty ? .noResults : .results(results)
            }
        } catch {
            await MainActor.run {
                searchState = .searchPrompt
                showError = error
            }
        }
    }
}

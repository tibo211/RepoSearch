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
        print("search")
    }
}

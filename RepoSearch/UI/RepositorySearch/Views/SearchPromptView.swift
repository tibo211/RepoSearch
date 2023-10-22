//
//  SearchPromptView.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-22.
//

import SwiftUI

struct SearchPromptView: View {
    let type: SearchState.SearchPromptType
    
    private var title: String {
        switch type {
        case .search:
            "Search GitHub Repositories"
        case let .noResults(query):
            "No Results for \"\(query)\""
        }
    }

    private var description: String {
        switch type {
        case .search:
            "Type the repository name and press Enter/Search"
        case .noResults:
            "Check the spelling or try a new search"
        }
    }
    
    var body: some View {
        Image(systemName: "magnifyingglass")
            .font(.largeTitle)
        Text(title)
            .font(.title)
        Text(description)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    VStack {
        SearchPromptView(type: .search)
        Divider()
        SearchPromptView(type: .noResults("query"))
    }
}

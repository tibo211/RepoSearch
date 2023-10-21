//
//  RepositorySearchView.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import SwiftUI

struct RepositorySearchView: View {
    @State var viewModel: RepositorySearchViewModel
    
    var body: some View {
        Group {
            if let results = viewModel.searchResults {
                RepositoryList(items: results) { item in
                    // TODO: Implement item selection
                }
            } else {
                // Placeholder prompt.
                Text("Search GitHub Repositories")
            }
        }
        .searchable(text: $viewModel.searchText)
        .onSubmit(of: .search) {
            Task {
                await viewModel.search()
            }
        }
    }
}

#Preview {
    NavigationStack {
        RepositorySearchView(viewModel: RepositorySearchViewModel())
    }
}

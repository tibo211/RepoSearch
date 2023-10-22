//
//  RepositorySearchView.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import SwiftUI
import GitHubData

struct RepositorySearchView: View {
    @State var viewModel: RepositorySearchViewModel
    @State private var selectedItem: RepositoryItem?
    
    var body: some View {
        Group {
            if let results = viewModel.searchResults {
                RepositoryList(items: results) { item in
                    selectedItem = item
                }
            } else {
                // Placeholder prompt.
                Text("Search GitHub Repositories")
            }
        }
        .animation(.default, value: viewModel.searchResults?.isEmpty)
        .searchable(text: $viewModel.searchText)
        .onSubmit(of: .search) {
            Task {
                await viewModel.search()
            }
        }
        .navigationDestination(item: $selectedItem) { item in
            RepositoryDetailsView(item: item)
        }
        .alert(error: $viewModel.showError)
    }
}

#Preview {
    NavigationStack {
        RepositorySearchView(viewModel: RepositorySearchViewModel())
    }
}

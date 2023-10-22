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
        VStack {
            switch viewModel.searchState {
            case .searchPrompt:
                Text("Search GitHub Repositories")
            case .loading:
                ProgressView()
            case let .results(items):
                RepositoryList(items: items) { item in
                    selectedItem = item
                }
            case .noResults:
                Image(systemName: "magnifyingglass")
                Text("No Results for \"\(viewModel.searchText)\"")
                Text("Check the spelling or try a new search")
                    .foregroundStyle(.secondary)
            }
        }
        .animation(.default, value: viewModel.searchState)
        .searchable(text: $viewModel.searchText,
                    placement: .navigationBarDrawer(displayMode: .always))
        .onSubmit(of: .search) {
            Task {
                await viewModel.search()
            }
        }
        .navigationDestination(item: $selectedItem) { item in
            RepositoryDetailsView(item: item)
        }
        .navigationTitle("Repositories")
        .alert(error: $viewModel.showError)
    }
}

#Preview {
    NavigationStack {
        RepositorySearchView(viewModel: RepositorySearchViewModel(repository: PreviewGitHubRepository()))
    }
}

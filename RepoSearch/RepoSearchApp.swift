//
//  RepoSearchApp.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-17.
//

import SwiftUI

@main
struct RepoSearchApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RepositorySearchView(viewModel: RepositorySearchViewModel())
            }
        }
    }
}

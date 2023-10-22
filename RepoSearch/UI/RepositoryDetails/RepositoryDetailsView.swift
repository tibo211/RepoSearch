//
//  RepositoryDetailsView.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-22.
//

import SwiftUI
import GitHubData

struct RepositoryDetailsView: View {
    let item: RepositoryItem
    
    var body: some View {
        RepositoryContentView(item: item)
            .navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        RepositoryDetailsView(item: .preview)
    }
}

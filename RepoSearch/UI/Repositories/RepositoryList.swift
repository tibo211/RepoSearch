//
//  RepositoryList.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import SwiftUI
import GitHubData

struct RepositoryList: View {
    let items: [RepositoryItem]
    let select: (RepositoryItem) -> Void
    
    var body: some View {
        List(items, id: \.name) { item in
            Button {
                select(item)
            } label: {
                RepositoryRow(item: item)
            }
            .tint(.primary)
        }
    }
}

#Preview {
    RepositoryList(items: .previews) { item in
        print("selected repo: \(item.name)")
    }
}

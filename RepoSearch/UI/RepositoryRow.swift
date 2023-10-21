//
//  RepositoryRow.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-20.
//

import SwiftUI
import GitHubData

struct RepositoryRow: View {
    let item: RepositoryItem

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.name)
                    .font(.title)
                
                Spacer()

                // TODO: Set async image.
                Image(systemName: "person.crop.circle")
                Text(item.owner.name)
            }
            
            if let description = item.description {
                Text(description)
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            HStack {
                Label("\(item.numberOfStars)", systemImage: "star")
                
                Spacer()
                if let language = item.language {
                    Text(language)
                }
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    RepositoryRow(item: [RepositoryItem].previews[0])
}

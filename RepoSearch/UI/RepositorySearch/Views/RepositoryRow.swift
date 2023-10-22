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

                Text(item.owner.name)
                
                AsyncImage(url: URL(string: item.owner.avatarUrl)) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "person.circle").resizable()
                }
                .frame(width: 20, height: 20)
                .clipShape(Circle())
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
    RepositoryRow(item: .preview)
}

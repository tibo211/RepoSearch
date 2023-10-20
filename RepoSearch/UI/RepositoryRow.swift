//
//  RepositoryRow.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-20.
//

import SwiftUI

struct RepositoryRow: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("XAgent")
                    .font(.title)
                
                Spacer()

                Image(systemName: "person.crop.circle")
                Text("luyaxi")
            }
            
            Text("An Autonomous LLM Agent for Complex Task Solving")
                .foregroundStyle(.secondary)
            
            Divider()
            
            HStack {
                Label("1855", systemImage: "star")
                
                Spacer()
                
                Text("TypeScript")
            }
            .font(.footnote)
        }
        .padding()
        .safeAreaInset(edge: .top) {
            Divider()
        }
    }
}

#Preview {
    VStack(spacing: 0) {
        RepositoryRow()
        RepositoryRow()
    }
}

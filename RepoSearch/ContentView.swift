//
//  ContentView.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-17.
//

import SwiftUI
import GitHubData

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("search test") {
                Task {
                    let items = try await GitHubData.repository.searchRepositories(query: "tetris")
                    print(items)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

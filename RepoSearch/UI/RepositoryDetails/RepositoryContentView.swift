//
//  RepositoryContentView.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-22.
//

import SwiftUI
import WebKit
import GitHubData

struct RepositoryContentView: UIViewRepresentable {
    let item: RepositoryItem
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ view: WKWebView, context: Context) {
        view.load(URLRequest(url: item.htmlUrl))
    }
}

#Preview {
    RepositoryContentView(item: .preview)
}

//
//  RepositoryItem+Previews.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import GitHubData
import Foundation

extension RepositoryItem {
    static let preview = [RepositoryItem].previews[0]
}

extension [RepositoryItem] {
    /// These previews were created by GPT-4.
    static let previews: [RepositoryItem] = [
        RepositoryItem(
            name: "TensorRT-LLM",
            description: "Provides users with an easy-to-use Python API to define Large Language Models (LLMs) and build TensorRT engines...",
            owner: Owner(name: "NVIDIA", avatarUrl: ""),
            language: "C++",
            numberOfStars: 1188,
            htmlUrl: URL(string: "https://github.com/NVIDIA/TensorRT-LLM")!
        ),
        RepositoryItem(
            name: "codeshell",
            description: "A series of code large language models developed by PKU-KCL",
            owner: Owner(name: "WisdomShell", avatarUrl: ""),
            language: "Python",
            numberOfStars: 769,
            htmlUrl: URL(string: "https://github.com/WisdomShell/codeshell")!
        ),
        RepositoryItem(
            name: "localsend",
            description: "An open source cross-platform alternative to AirDrop",
            owner: Owner(name: "localsend", avatarUrl: ""),
            language: "Dart",
            numberOfStars: 18338,
            htmlUrl: URL(string: "https://github.com/localsend/localsend")!
        ),
        RepositoryItem(
            name: "XAgent",
            description: "An Autonomous LLM Agent for Complex Task Solving",
            owner: Owner(name: "OpenBMB", avatarUrl: ""),
            language: "TypeScript",
            numberOfStars: 2321,
            htmlUrl: URL(string: "https://github.com/OpenBMB/XAgent")!
        ),
    ]
}

//
//  RepositorySearchViewModelTests.swift
//  RepoSearchTests
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import XCTest
@testable import RepoSearch

final class RepositorySearchViewModelTests: XCTestCase {
    func testHaveSearchResults() async {
        let viewModel = RepositorySearchViewModel()
        viewModel.searchText = "NVIDIA"
        viewModel.search()
        
        XCTAssertNotNil(viewModel.searchResults)
    }
}

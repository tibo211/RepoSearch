//
//  RepositorySearchViewModelTests.swift
//  RepoSearchTests
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import XCTest
import GitHubData
@testable import RepoSearch

final class RepositorySearchViewModelTests: XCTestCase {
    typealias SubjectUnderTest = RepositorySearchViewModel
    
    func createSUT(repository: MockGitHubRepository) -> SubjectUnderTest {
        RepositorySearchViewModel(repository: repository)
    }

    // MARK: - SearchState
    
    func testSearchState_returnsResults() async {
        let result = [RepositoryItem].previews
        
        let viewModel = createSUT(repository: .mock(returns: .success(result)))
        viewModel.searchText = "NVIDIA"

        await viewModel.search()
        
        XCTAssertEqual(viewModel.searchState, .results(result))
    }
    
    func testSearchState_searchPrompt() async {
        let viewModel = createSUT(repository: .mock(returns: .success([])))
        
        XCTAssertEqual(viewModel.searchState, .prompt(.search))
        
        viewModel.searchText = "query"
        
        await viewModel.search()
        XCTAssertNotEqual(viewModel.searchState, .prompt(.search))
        
        viewModel.searchText = ""
        XCTAssertEqual(viewModel.searchState, .prompt(.search))
    }
    
    func testSearchState_noResultsPrompt() async {
        let viewModel = createSUT(repository: .mock(returns: .success([])))
        
        viewModel.searchText = "query"
        
        await viewModel.search()
        
        XCTAssertEqual(viewModel.searchState, .prompt(.noResults("query")))
    }
    
    // MARK: - Error handling
    
    func testSearch_showsError() async {
        let error = URLError(.badURL)
        
        let viewModel = createSUT(repository: .mock(returns: .failure(error)))
        
        await viewModel.search()
        
        XCTAssertEqual(viewModel.showError as? URLError, error)
    }
}

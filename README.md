# RepoSearch

RepoSearch is a native iOS application that allows users to search through GitHub open-source repositories. The app provides a simple and user-friendly interface to search for repositories and view the repository in a in webview.

## App structure

### GitHubData layer

The `GitHubData` package contains the basic data models (`ReposityItem`, `Owner`) and the repositoies (`GitHubRepository`) with a simple URL request. 

### Application layer

- RepositorySearchView: This view combines a search bar with the search results, displayed as a RepositoryListView. If no search has been conducted, the user is presented with a prompt guiding them on how to initiate a search.
- RepositoryDetailView: This view utilizes a webview to display the HTML page of the selected repository.

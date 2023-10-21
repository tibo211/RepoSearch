//
//  ErrorAlertModifier.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import SwiftUI

struct ErrorAlertModifier: ViewModifier {
    @Binding var error: Error?
    
    func body(content: Content) -> some View {
        content
            .alert("Error", isPresented: $error.optionalFlag()) {
                Button("Ok", role: .cancel) {}
            } message: {
                Text(error?.localizedDescription ?? "Something went wrong.")
            }
    }
}

extension View {
    /// Presents an alert when an error occurs.
    ///
    /// This function applies the `ErrorAlertModifier` to the view, which presents an alert displaying
    /// the error's localized description whenever the error is non-nil.
    ///
    /// - Parameter error: A binding to an optional `Error` object.
    /// - Returns: The view modified with an `ErrorAlertModifier`.
    func alert(error: Binding<Error?>) -> some View {
        modifier(ErrorAlertModifier(error: error))
    }
}

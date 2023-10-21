//
//  Binding+Extensions.swift
//  RepoSearch
//
//  Created by Tibor Felföldy on 2023-10-21.
//

import SwiftUI

extension Binding {
    /// Returns a binding to a Boolean value indicating whether the wrapped value is nil or not.
    ///
    /// When the Boolean binding is set to false, the wrapped value is set to nil.
    func optionalFlag<T>() -> Binding<Bool> where Value == T? {
        Binding<Bool> {
            wrappedValue != nil
        } set: { isActive in
            if !isActive {
                wrappedValue = nil
            }
        }
    }
}

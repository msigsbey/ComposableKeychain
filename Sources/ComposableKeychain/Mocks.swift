//
//  Mocks.swift
//  
//
//  Created by Michael Sigsbey on 7/17/22.
//

import ComposableArchitecture

extension KeychainClient {
    public static var noop = Self(
        getString: { _ in .none },
        getData: { _ in .none },
        setString: { _, _ in .none },
        setData: { _, _ in .none },
        remove: { _ in .none },
        removeAll: { .none },
        contains: { _ in .none }
    )

    public static var failing = Self(
        getString: { _ in .failing("\(Self.self).getString is unimplemented") },
        getData: { _ in .failing("\(Self.self).getData is unimplemented") },
        setString: { _, _ in .failing("\(Self.self).setString is unimplemented") },
        setData: { _, _ in .failing("\(Self.self).setData is unimplemented") },
        remove: { _ in .failing("\(Self.self).remove is unimplemented") },
        removeAll: { .failing("\(Self.self).removeAll is unimplemented") },
        contains: { _ in .failing("\(Self.self).contains is unimplemented") }
    )
}

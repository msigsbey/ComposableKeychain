//
//  Mocks.swift
//  
//
//  Created by Michael Sigsbey on 7/17/22.
//

import ComposableArchitecture

extension KeychainClient {
    public static var noop = Self(
        getString: { _ in nil },
        getData: { _ in nil },
        setString: { _, _ in },
        setData: { _, _ in },
        remove: { _ in },
        removeAll: { },
        contains: { _ in false }
    )

    public static var failing = Self(
        getString: { _ in unimplemented("\(Self.self).getString is unimplemented") },
        getData: { _ in unimplemented("\(Self.self).getData is unimplemented") },
        setString: { _, _ in unimplemented("\(Self.self).setString is unimplemented") },
        setData: { _, _ in unimplemented("\(Self.self).setData is unimplemented") },
        remove: { _ in unimplemented("\(Self.self).remove is unimplemented") },
        removeAll: { unimplemented("\(Self.self).removeAll is unimplemented") },
        contains: { _ in unimplemented("\(Self.self).contains is unimplemented") }
    )
}

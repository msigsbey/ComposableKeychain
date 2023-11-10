//
//  Live.swift
//  
//
//  Created by Michael Sigsbey on 7/17/22.
//

import Foundation
import KeychainAccess
import ComposableArchitecture

extension KeychainClient {
    public static func live(
        keychain: Keychain
    ) -> Self {
        Self(
            getString: { key in
                try keychain.getString(key.rawValue)
            },
            getData: { key in
                try keychain.getData(key.rawValue)
            },
            setString: { string, key in
                try keychain.set(string, key: key.rawValue)
            },
            setData: { data, key in
                try keychain.set(data, key: key.rawValue)
            },
            remove: { key in
                try keychain.remove(key.rawValue)
            },
            removeAll: {
                try keychain.removeAll()
            },
            contains: { key in
                try keychain.contains(key.rawValue)
            }
        )
    }
}

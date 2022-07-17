//
//  Live.swift
//  
//
//  Created by Michael Sigsbey on 7/17/22.
//

import KeychainAccess
import ComposableArchitecture

extension KeychainClient {
    public static func live(
        keychain: Keychain
    ) -> Self {
        Self(
            getString: { key in
                Effect
                    .catching { try keychain.getString(key.rawValue) }
            },
            getData: { key in
                Effect
                    .catching { try keychain.getData(key.rawValue) }
            },
            setString: { string, key in
                Effect
                    .catching { try keychain.set(string, key: key.rawValue) }
                    .fireAndForget()
            },
            setData: { data, key in
                Effect
                    .catching { try keychain.set(data, key: key.rawValue) }
                    .fireAndForget()
            },
            remove: { key in
                Effect
                    .catching { try keychain.remove(key.rawValue) }
                    .fireAndForget()
            },
            removeAll: {
                Effect
                    .catching { try keychain.removeAll() }
                    .fireAndForget()
            },
            contains: { key in
                Effect
                    .catching { try keychain.contains(key.rawValue) }
            }
        )
    }
}

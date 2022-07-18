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
        keychain: Keychain,
        queue: AnySchedulerOf<DispatchQueue>
    ) -> Self {
        Self(
            getString: { key in
                Effect
                    .catching { try keychain.getString(key.rawValue) }
                    .subscribe(on: queue)
                    .fireAndForget()
            },
            getData: { key in
                Effect
                    .catching { try keychain.getData(key.rawValue) }
                    .subscribe(on: queue)
                    .fireAndForget()
            },
            setString: { string, key in
                Effect
                    .catching { try keychain.set(string, key: key.rawValue) }
                    .subscribe(on: queue)
                    .fireAndForget()
            },
            setData: { data, key in
                Effect
                    .catching { try keychain.set(data, key: key.rawValue) }
                    .subscribe(on: queue)
                    .fireAndForget()
            },
            remove: { key in
                Effect
                    .catching { try keychain.remove(key.rawValue) }
                    .subscribe(on: queue)
                    .fireAndForget()
            },
            removeAll: {
                Effect
                    .catching { try keychain.removeAll() }
                    .subscribe(on: queue)
                    .fireAndForget()
            },
            contains: { key in
                Effect
                    .catching { try keychain.contains(key.rawValue) }
                    .subscribe(on: queue)
                    .fireAndForget()
            }
        )
    }
}

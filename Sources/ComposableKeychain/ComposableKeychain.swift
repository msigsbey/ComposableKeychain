//
//  ComposableKeychainClient.swift
//
//
//  Created by Michael Sigsbey on 7/17/22.
//

import Foundation
import ComposableArchitecture

public struct KeychainClient {
    public var getString: (_ key: Key) -> Effect<String?, Error>
    public var setString: (_ value: String, _ key: Key) -> Effect<Never, Error>
    public var getData: (_ key: Key) -> Effect<Data?, Error>
    public var setData: (_ value: Data, _ key: Key) -> Effect<Never, Error>
    public var remove: (_ key: Key) -> Effect<Never, Error>
    public var removeAll: () -> Effect<Never, Error>
    public var contains: (_ key: Key) -> Effect<Bool, Error>

    public init(
        getString: @escaping (_ key: Key) -> Effect<String?, Error>,
        getData: @escaping (_ key: Key) -> Effect<Data?, Error>,
        setString: @escaping (_ value: String, _ key: Key) -> Effect<Never, Error>,
        setData: @escaping (_ value: Data, _ key: Key) -> Effect<Never, Error>,
        remove: @escaping (_ key: Key) -> Effect<Never, Error>,
        removeAll: @escaping () -> Effect<Never, Error>,
        contains: @escaping (_ key: Key) -> Effect<Bool, Error>
    ) {
        self.getString = getString
        self.getData = getData
        self.setString = setString
        self.setData = setData
        self.remove = remove
        self.removeAll = removeAll
        self.contains = contains
    }

    public struct Key: RawRepresentable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }

        public init(_ rawValue: String) {
            self.init(rawValue: rawValue)
        }
    }
}

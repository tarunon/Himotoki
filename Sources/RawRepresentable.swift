//
//  RawRepresentable.swift
//  Himotoki
//
//  Created by Syo Ikeda on 9/27/15.
//  Copyright © 2015 Syo Ikeda. All rights reserved.
//

public extension RawRepresentable where Self: Decodable, RawValue: Decodable {
    public init(decode e: Extractor) throws {
        let rawValue = try RawValue(decode :e)

        guard let value = Self(rawValue: rawValue) else {
            throw typeMismatch("rawValue for \(Self.self)", actual: rawValue)
        }

        self = value
    }
}

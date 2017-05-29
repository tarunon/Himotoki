//
//  StandardLib.swift
//  Himotoki
//
//  Created by Syo Ikeda on 11/18/15.
//  Copyright © 2015 Syo Ikeda. All rights reserved.
//

extension String: CastDecodable {

}

extension Int: CastDecodable {

}

extension UInt: CastDecodable {

}

extension Double: CastDecodable {

}

extension Float: CastDecodable {

}

extension Bool: CastDecodable {

}

// MARK: - Extensions

extension Collection where Iterator.Element: Decodable {
    /// - Throws: DecodeError or an arbitrary ErrorType
    public static func decode(_ JSON: Any) throws -> [Iterator.Element] {
        guard let array = JSON as? [Any] else {
            throw typeMismatch("Array", actual: JSON)
        }

        return try array.map(Iterator.Element.decodeValue)
    }

    /// - Throws: DecodeError or an arbitrary ErrorType
    public static func decode(_ JSON: Any, rootKeyPath: KeyPath) throws -> [Iterator.Element] {
        return try Extractor(JSON).array(rootKeyPath)
    }
}

extension ExpressibleByDictionaryLiteral where Value: Decodable {
    /// - Throws: DecodeError or an arbitrary ErrorType
    public static func decode(_ JSON: Any) throws -> [String: Value] {
        guard let dictionary = JSON as? [String: Any] else {
            throw typeMismatch("Dictionary", actual: JSON)
        }

        return try dictionary.mapValue(Value.decodeValue)
    }

    /// - Throws: DecodeError or an arbitrary ErrorType
    public static func decode(_ JSON: Any, rootKeyPath: KeyPath) throws -> [String: Value] {
        return try Extractor(JSON).dictionary(rootKeyPath)
    }
}

extension Dictionary {
    internal func mapValue<T>(_ transform: (Value) throws -> T) rethrows -> [Key: T] {
        var result = [Key: T](minimumCapacity: count)
        for (key, value) in self {
            result[key] = try transform(value)
        }
        return result
    }
}

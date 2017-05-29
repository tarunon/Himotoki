//
//  NSNumber.swift
//  Himotoki
//
//  Created by Syo Ikeda on 11/18/15.
//  Copyright © 2015 Syo Ikeda. All rights reserved.
//

import class Foundation.NSNumber

extension NSNumber: CastDecodable {
    
}

extension Int8: Decodable {
    public init(decode e: Extractor) throws {
        self = try NSNumber(decode: e).int8Value
    }
}

extension UInt8: Decodable {
    public init(decode e: Extractor) throws {
        self = try NSNumber(decode: e).uint8Value
    }
}

extension Int16: Decodable {
    public init(decode e: Extractor) throws {
        self = try NSNumber(decode: e).int16Value
    }
}

extension UInt16: Decodable {
    public init(decode e: Extractor) throws {
        self = try NSNumber(decode: e).uint16Value
    }
}

extension Int32: Decodable {
    public init(decode e: Extractor) throws {
        self = try NSNumber(decode: e).int32Value
    }
}

extension UInt32: Decodable {
    public init(decode e: Extractor) throws {
        self = try NSNumber(decode: e).uint32Value
    }
}

extension Int64: Decodable {
    public init(decode e: Extractor) throws {
        self = try NSNumber(decode: e).int64Value
    }
}

extension UInt64: Decodable {
    public init(decode e: Extractor) throws {
        self = try NSNumber(decode: e).uint64Value
    }
}

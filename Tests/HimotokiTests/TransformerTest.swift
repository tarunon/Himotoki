//
//  TransformerTest.swift
//  Himotoki
//
//  Created by Syo Ikeda on 2/27/16.
//  Copyright © 2016 Syo Ikeda. All rights reserved.
//

import Foundation
import XCTest
import Himotoki

private func toURL(_ s: String) throws -> URL { // swiftlint:disable:this variable_name
    if let URL = URL(string: s) {
        return URL
    }

    throw customError("Invalid URL string: \(s)")
}

private struct URLsByTransformer: Decodable {
    let value: URL
    let valueOptional: URL?
    let array: [URL]
    let arrayOptional: [URL]?
    let dictionary: [String: URL]
    let dictionaryOptional: [String: URL]?

    init(decode e: Extractor) throws {
        let URLTransformer = Transformer(toURL)

        self.value = try Transformer { try toURL($0) }.apply(e <| "value")
        self.valueOptional = try URLTransformer.apply(e <|? "valueOptional")
        self.array = try URLTransformer.apply(e.array("array"))
        self.arrayOptional = try URLTransformer.apply(e <||? "arrayOptional")
        self.dictionary = try URLTransformer.apply(e <|-| "dictionary")
        self.dictionaryOptional = try URLTransformer.apply(e.dictionaryOptional("dictionaryOptional"))
    }
}

class TransformerTest: XCTestCase {

    func testTransformerSuccess() {
        let URLString = "http://www.yahoo.co.jp/"
        let url = URL(string: URLString)!
        let JSON: [String: Any] = [
            "value": URLString,
            "valueOptional": URLString,
            "array": [ URLString, URLString ],
            "arrayOptional": [ URLString, URLString ],
            "dictionary": [ "a": URLString, "b": URLString ],
            "dictionaryOptional": [ "a": URLString, "b": URLString ],
        ]

        guard let decoded = try? URLsByTransformer.decodeValue(JSON) else {
            XCTFail()
            return
        }

        XCTAssertEqual(decoded.value, url)
        XCTAssertEqual(decoded.valueOptional, url)
        XCTAssertEqual(decoded.array, [ url, url ])
        XCTAssertEqual(decoded.arrayOptional!, [ url, url ])
        XCTAssertEqual(decoded.dictionary, [ "a": url, "b": url ])
        XCTAssertEqual(decoded.dictionaryOptional!, [ "a": url, "b": url ])
    }

    func testTransformerFailure() {
        let URLString = "日本語"
        let JSON: [String: Any] = [
            "value": URLString,
        ]

        do {
            _ = try URLsByTransformer.decodeValue(JSON)
        } catch let DecodeError.custom(message) {
            XCTAssertEqual(message, "Invalid URL string: \(URLString)")
        } catch {
            XCTFail()
        }
    }
}

extension TransformerTest {
    static var allTests: [(String, (TransformerTest) -> () throws -> Void)] {
        return [
            ("testTransformerSuccess", testTransformerSuccess),
            ("testTransformerFailure", testTransformerFailure),
        ]
    }
}

//
//  DecodableTest.swift
//  Himotoki
//
//  Created by Syo Ikeda on 5/2/15.
//  Copyright (c) 2015 Syo Ikeda. All rights reserved.
//

import Foundation
import XCTest
import Himotoki

typealias JSONArray = [Any]
typealias JSONDictionary = [String: Any]

class DecodableTest: XCTestCase {

    lazy var personJSON: JSONDictionary = {
        let gruopJSON: JSONDictionary = [ "name": "Himotoki", "floor": 12 ]
        var JSON: JSONDictionary = [
            "first_name": "ABC",
            "last_name": "DEF",
            "age": 20,
            "int64": NSNumber(value: Int64.max),
            "height": 175.9,
            "float": 32.1 as Float,
            "bool": true,
            "number": NSNumber(value: 123456789),
            "raw_value": "RawValue",
            "nested": [
                "value": "The nested value",
                "dict": [ "key": "The nested value" ]
            ],
            "array": [ "123", "456" ],
            "arrayOption": NSNull(),
            "dictionary": [ "A": 1, "B": 2 ],
            // "dictionaryOption" key is missing
            "group": gruopJSON,
        ]

        JSON["groups"] = [ gruopJSON, gruopJSON ]

        return JSON
    }()

    func testPerson() { // swiftlint:disable:this function_body_length
        var JSON = personJSON

        // Succeeding case
        let person = try? Person.decodeValue(JSON)
        XCTAssert(person != nil)
        XCTAssert(person?.firstName == "ABC")
        XCTAssert(person?.lastName == "DEF")
        XCTAssert(person?.age == 20)
        XCTAssert(person?.int64 == Int64.max)
        XCTAssert(person?.height == 175.9)
        XCTAssert(person?.float == 32.1)
        XCTAssert(person?.bool == true)
        XCTAssert(person?.number == NSNumber(value: 123456789))
        XCTAssert(person?.rawValue as? String == "RawValue")

        XCTAssert(person?.nested == "The nested value")
        XCTAssert(person?.nestedDict["key"] == "The nested value")
        XCTAssert(person?.array.count == 2)
        XCTAssert(person?.array.first == "123")
        XCTAssert(person?.arrayOption == nil)
        XCTAssert(person?.dictionary.count == 2)
        XCTAssert(person?.dictionary["A"] == 1)
        XCTAssert(person?.dictionaryOption == nil)

        XCTAssert(person?.group.name == "Himotoki")
        XCTAssert(person?.group.floor == 12)
        XCTAssert(person?.group.optional == nil)
        XCTAssert(person?.groups.count == 2)

        // Failing cases

        do {
            JSON["bool"] = nil
            JSON["group"] = nil
            _ = try Person.decodeValue(JSON)
        } catch let DecodeError.missingKeyPath(keyPath) {
            XCTAssert(keyPath == "bool")
        } catch {
            XCTFail()
        }

        do {
            JSON["age"] = "foo_bar"
            _ = try Person.decodeValue(JSON)
        } catch let DecodeError.typeMismatch(expected, actual, keyPath) {
            XCTAssertEqual(keyPath, "age")
            XCTAssertTrue(actual.contains("foo_bar"))
            XCTAssertEqual(expected, "Int")
        } catch {
            XCTFail()
        }
    }

    func testPerformanceByPersons() {
        #if _runtime(_ObjC)
            // Intentionally bridged to `NSArray` for the performance test. That
            // should match return values from `JSONSerialization`.
            let peopleJSON: Any = Array(NSArray(array: Array(repeating: personJSON, count: 500)))
        #else
            let peopleJSON: Any = Array(repeating: personJSON, count: 500)
        #endif

        measure {
            do {
                _ = try [Person].decode(peopleJSON)
            } catch {
                XCTFail(String(describing: error))
            }
        }
    }

    func testGroup() {
        var JSON: JSONDictionary = [ "name": "Himotoki", "floor": 12 ]

        let g = try? Group.decodeValue(JSON)
        XCTAssert(g != nil)
        XCTAssert(g?.name == "Himotoki")
        XCTAssert(g?.floor == 12)
        XCTAssert(g?.optional == nil)

        JSON["name"] = nil
        do {
            _ = try Group.decodeValue(JSON)
        } catch let DecodeError.missingKeyPath(keyPath) {
            XCTAssert(keyPath == "name")
        } catch {
            XCTFail()
        }
    }

    func testDecodeArray() {
        let JSON: JSONDictionary = [ "name": "Himotoki", "floor": 12 ]
        let array: JSONArray = [ JSON, JSON ]

        let values = try? [Group].decode(array)
        XCTAssert(values != nil)
        XCTAssert(values?.count == 2)
    }

    func testDecodeDictionary() {
        let JSON: JSONDictionary = [ "name": "Himotoki", "floor": 12 ]
        let dictionary: JSONDictionary = [ "1": JSON, "2": JSON ]

        let values = try? [String: Group].decode(dictionary)
        XCTAssert(values != nil)
        XCTAssert(values?.count == 2)
    }

    func testDecodeNumbers() {
        let JSON: JSONDictionary = [
            "int": Int.min,
            "uint": UInt.max,
            "int8": NSNumber(value: Int8.min),
            "uint8": NSNumber(value: UInt8.max),
            "int16": NSNumber(value: Int16.min),
            "uint16": NSNumber(value: UInt16.max),
            "int32": NSNumber(value: Int32.min),
            "uint32": NSNumber(value: UInt32.max),
            "int64": NSNumber(value: Int64.min),
            "uint64": NSNumber(value: UInt64.max),
        ]

        let numbers = try? Numbers.decodeValue(JSON)
        XCTAssert(numbers != nil)
        XCTAssert(numbers?.int == Int.min)
        XCTAssert(numbers?.uint == UInt.max)
        XCTAssert(numbers?.int8 == Int8.min)
        XCTAssert(numbers?.uint8 == UInt8.max)
        XCTAssert(numbers?.int16 == Int16.min)
        XCTAssert(numbers?.uint16 == UInt16.max)
        XCTAssert(numbers?.int32 == Int32.min)
        XCTAssert(numbers?.uint32 == UInt32.max)
        XCTAssert(numbers?.int64 == Int64.min)
        XCTAssert(numbers?.uint64 == UInt64.max)
    }

}

extension DecodableTest {
    static var allTests: [(String, (DecodableTest) -> () throws -> Void)] {
        return [
            ("testPerson", testPerson),
            ("testPerformanceByPersons", testPerformanceByPersons),
            ("testGroup", testGroup),
            ("testDecodeArray", testDecodeArray),
            ("testDecodeDictionary", testDecodeDictionary),
            ("testDecodeNumbers", testDecodeNumbers),
        ]
    }
}

struct Person: Decodable {
    let firstName: String
    let lastName: String
    let age: Int
    let int64: Int64
    let height: Double
    let float: Float
    let bool: Bool
    let number: NSNumber
    let rawValue: Any

    let nested: String
    let nestedDict: [String: String]
    let array: [String]
    let arrayOption: [String]?
    let dictionary: [String: Int]
    let dictionaryOption: [String: Int]?

    let group: Group
    let groups: [Group]

    init(decode e: Extractor) throws {
        self.firstName = try e <| "first_name"
        self.lastName = try e <| "last_name"
        self.age = try e <| "age"
        self.int64 = try e <| "int64"
        self.height = try e <| "height"
        self.float = try e <| "float"
        self.bool = try e <| "bool"
        self.number = try e <| "number"
        self.rawValue = try (e <| "raw_value" as Extractor).rawValue
        self.nested = try e <| [ "nested", "value" ]
        self.nestedDict = try e <|-| [ "nested", "dict" ]
        self.array = try e <|| "array"
        self.arrayOption = try e <||? "arrayOption"
        self.dictionary = try e <|-| "dictionary"
        self.dictionaryOption = try e <|-|? "dictionaryOption"
        self.group = try e <| "group"
        self.groups = try e <|| "groups"
    }
}

struct Group: Decodable {
    let name: String
    let floor: Int
    let optional: [String]?

    init(decode e: Extractor) throws {
        self.name = try e <| "name"
        self.floor = try e <| "floor"
        self.optional = try e <||? "optional"
    }
}

struct Numbers: Decodable {
    let int: Int
    let uint: UInt
    let int8: Int8
    let uint8: UInt8
    let int16: Int16
    let uint16: UInt16
    let int32: Int32
    let uint32: UInt32
    let int64: Int64
    let uint64: UInt64

    init(decode e: Extractor) throws {
        self.int = try e <| "int"
        self.uint = try e <| "uint"
        self.int8 = try e <| "int8"
        self.uint8 = try e <| "uint8"
        self.int16 = try e <| "int16"
        self.uint16 = try e <| "uint16"
        self.int32 = try e <| "int32"
        self.uint32 = try e <| "uint32"
        self.int64 = try e <| "int64"
        self.uint64 = try e <| "uint64"
    }
}

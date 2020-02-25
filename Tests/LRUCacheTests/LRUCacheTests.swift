//
//  LRUCacheTests.swift
//  LRUCacheTests
//

import XCTest
import LRUCache

final class LRUCacheTests: XCTestCase {
	func testLRUHoldCapacity() {
		let capacity = 50
		
		let keys = (0..<capacity).map { _ in Int.random(in: .min ... .max) }
		let values = (0..<capacity).map { _ in Int.random(in: .min ... .max) }
		
		var cache = LRUCache<Int, Int>(capacity: capacity)
		
		for (k,v) in zip(keys, values) {
			cache.set(k, value: v)
		}
		
		for (k,v) in zip(keys, values) {
			XCTAssertEqual(cache.get(k), v)
		}
	}
	
	func testLRUEvictsFirstAdded() {
		let capacity = 50
		let evictedKeyIndex = 0
		
		let keys = (0..<(capacity+1)).map { _ in Int.random(in: .min ... .max) }
		let values = (0..<(capacity+1)).map { _ in Int.random(in: .min ... .max) }
		
		var cache = LRUCache<Int, Int>(capacity: capacity)
		
		for (k,v) in zip(keys, values) {
			cache.set(k, value: v)
		}
		
		XCTAssertNil(cache.get(keys[evictedKeyIndex]))
		for (k,v) in zip(keys, values).dropFirst() {
			XCTAssertEqual(cache.get(k), v)
		}
	}
	
	func testLRUEvictsOldest() {
		let capacity = 5
		let evictedKeyIndex = 1
		
		let keys = (0..<(capacity+1)).map { $0 }
		let values = (0..<(capacity+1)).map { $0 }
		
		var cache = LRUCache<Int, Int>(capacity: capacity)
		
		for (k,v) in zip(keys, values) {
			cache.set(k, value: v)
			for i in 0..<keys.count {
				if i == evictedKeyIndex { continue }
				_ = cache.get(keys[i]) // touch all keys but evictedKeyIndex
			}
		}
		
		XCTAssertNil(cache.get(keys[evictedKeyIndex]))
		for (i,(k,v)) in zip(keys, values).enumerated() {
			if i == evictedKeyIndex { continue }
			XCTAssertEqual(cache.get(k), v)
		}
	}
}

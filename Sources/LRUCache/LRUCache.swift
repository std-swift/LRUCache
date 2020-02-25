//
//  LRUCache.swift
//  LRUCache
//

public struct LRUCache<Key, Value> where Key: Hashable {
	typealias List = LinkedList<(Key, Value)>
	
	private var list = List()
	private var dict = Dictionary<Key, List.Node>()
	
	private let capacity: Int
	
	public init(capacity: Int) {
		precondition(capacity > 0, "Must store at least one element")
		self.capacity = capacity
	}
	
	public mutating func get(_ key: Key) -> Value? {
		if let node = self.dict[key] {
			self.list.remove(node)
			self.list.push(node)
			return node.value.1
		}
		return nil
	}
	
	public mutating func set(_ key: Key, value: Value) {
		if let node = self.dict[key] {
			self.list.remove(node)
		} else {
			if self.dict.count >= self.capacity {
				let value = self.list.removeLast()
				self.dict.removeValue(forKey: value.0)
			}
		}
		self.dict[key] = self.list.push((key, value))
	}
}

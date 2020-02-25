//
//  LinkedList.swift
//  LRUCache
//

internal class LinkedListNode<Element> {
	fileprivate var next: LinkedListNode<Element>? = nil
	fileprivate var prev: LinkedListNode<Element>? = nil
	
	internal let value: Element
	
	fileprivate init(value: Element) {
		self.value = value
	}
}

internal struct LinkedList<Element> {
	typealias Node = LinkedListNode<Element>
	
	private(set) var first: Node? = nil
	private(set) var last: Node? = nil
	
	mutating func push(_ element: Element) -> Node {
		let node = Node(value: element)
		self.push(node)
		return node
	}
	
	mutating func push(_ node: Node) {
		node.next = self.first
		node.prev = nil
		
		if self.first === nil {
			self.last = node
		}
		if let first = self.first {
			first.prev = node
		}
		
		self.first = node
	}
	
	mutating func removeLast() -> Element {
		precondition(self.last != nil, "Can't remove last element from an empty LinkedList")
		let node = self.last!
		self.remove(node)
		return node.value
	}
	
	mutating func remove(_ node: Node) {
		if let prev = node.prev { prev.next  = node.next }
		if let next = node.next { next.prev  = node.prev }
		
		if self.last  === node  { self.last  = node.prev }
		if self.first === node  { self.first = node.next }
		
		node.next = nil
		node.prev = nil
	}
}

// swift-tools-version:5.0
//
//  Package.swift
//  Encoding
//

import PackageDescription

let package = Package(
	name: "LRUCache",
	products: [
		.library(
			name: "LRUCache",
			targets: ["LRUCache"]),
	],
	targets: [
		.target(
			name: "LRUCache",
			dependencies: []),
		.testTarget(
			name: "LRUCacheTests",
			dependencies: ["LRUCache"]),
	]
)

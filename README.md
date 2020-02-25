# LRUCache

[![](https://img.shields.io/badge/Swift-5.0-orange.svg)][1]
[![](https://img.shields.io/badge/os-macOS%20|%20Linux-lightgray.svg)][1]
[![](https://travis-ci.com/std-swift/LRUCache.svg?branch=master)][2]
[![](https://codecov.io/gh/std-swift/LRUCache/branch/master/graph/badge.svg)][3]
[![](https://codebeat.co/badges/55895634-4c45-4624-bf74-2afb8bdf54d4)][4]

[1]: https://swift.org/download/#releases
[2]: https://travis-ci.com/std-swift/LRUCache
[3]: https://codecov.io/gh/std-swift/LRUCache
[4]: https://codebeat.co/projects/github-com-std-swift-lrucache-master

Limited size cache

## Importing

```Swift
import LRUCache
```

```Swift
dependencies: [
	.package(url: "https://github.com/std-swift/LRUCache.git",
	         from: "0.1.0")
],
targets: [
	.target(
		name: "",
		dependencies: [
			"LRUCache"
		]),
]
```

## Using

```swift
var cache = LRUCache<Int, Int>(capacity: 1)
cache.set(1, value: 5)
_ = cache.get(1) // 5
```

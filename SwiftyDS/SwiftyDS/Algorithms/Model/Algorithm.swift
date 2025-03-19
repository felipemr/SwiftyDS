//
//  Algorithm.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 19/03/25.
//

import Foundation

struct Algorithm: Identifiable {
	var id = UUID()
	var name: String
	var enabled: Bool
	private let fileName: String
	private let fileExtension: String = "md"
	
	init(_ name: String, fileName: String, enabled: Bool = true) {
		self.name = name
		self.fileName = fileName
		self.enabled = enabled
	}
	
	init (_ name: String, enabled: Bool = true) {
		self.name = name
		self.fileName = name
		self.enabled = enabled
	}
	
	var fileContents: String? {
		if let filepath = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
			return try? String(contentsOf: filepath)
		}
		return nil
	}
}

// List of all Algorithm availables
extension Algorithm {
	static let list: [Algorithm] = [
		.init("Big O Notation", fileName: "filename", enabled: true),
		.init("Search", enabled: false),
		.init("Sorting Algorithms", enabled: false),
		.init("Dynamic Programming", enabled: false),
		.init("Recursion", enabled: false),
		.init("Backtracking", enabled: false),
		.init("Greedy", enabled: false),
		.init("Two Pointers", enabled: false),
		.init("Slinding Window", enabled: false),
		.init("Bit Manipulation", enabled: false),
		.init("Tortoise and the Hare", enabled: false)
	]
}

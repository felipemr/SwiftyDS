//
//  DataStructure.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 19/03/25.
//
import Foundation

struct DataStructure: Identifiable {
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
extension DataStructure {
	static let list: [DataStructure] = [
		.init("Array", enabled: false),
		.init("Linked List", enabled: false),
		.init("Stack", enabled: false),
		.init("Queue", enabled: false),
		.init("Tree", enabled: false),
		.init("Tree", enabled: false),
		.init("Graph", enabled: false),
		.init("Hash Table", enabled: false),
		.init("Trie", enabled: false),
		.init("Heap", enabled: false),
	]
}

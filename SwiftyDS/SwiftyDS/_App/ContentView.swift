//
//  ContentView.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 09/10/24.
//

import MarkdownUI
import SwiftUI

struct ContentView: View {
	
	let algoList = ["Big O Notation", "Search", "Sorting Algorithms", "Dynamic Programming", "Recursion", "Backtracking", "Greedy","Two Pointers", "Slinding Window", "Bit Manipulation", "Tortoise and the Hare"]
	let dsList = ["Array", "Linked List", "Stack", "Queue", "Tree", "Graph", "Hash Table", "Trie", "Heap"]
	
    var body: some View {
		NavigationStack {
			List {
				NavigationLink("Test" ) {
					ShowMarkdown()
				}
				Section("Algorithms") {
					ForEach(algoList, id: \.self) { algo in
						contentCell(algo)
					}
				}
				Section("Data Structures") {
					ForEach(dsList, id: \.self) { ds in
						contentCell(ds)
					}
				}
			}
		}
    }
	
	@ViewBuilder
	func contentCell(_ title: String) -> some View {
		NavigationLink(title) {
			Text("Info about \(title)")
		}
	}
}

struct ShowMarkdown: View {
	// Get the path to your markdown file.
	
	var text: String {
		let filepath = Bundle.main.url(forResource: "filename", withExtension: "md")!
		 return try! String(contentsOf: filepath)
	}


	var body: some View {
		// Show the markdown.
		ScrollView {
			Markdown(text)
		}
	}
}

#Preview {
    ContentView()
}

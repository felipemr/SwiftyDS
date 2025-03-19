//
//  ContentView.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 09/10/24.
//

import MarkdownUI
import SwiftUI

struct ContentView: View {
	
	let algoList = Algorithm.list
	
	let dsList = [
		"Array",
		"Linked List",
		"Stack",
		"Queue",
		"Tree",
		"Graph",
		"Hash Table",
		"Trie",
		"Heap"]
	
    var body: some View {
		NavigationStack {
			List {
				Section("Algorithms") {
					ForEach(algoList) { algo in
						algoCell(algo)
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
	
	@ViewBuilder
	func algoCell(_ algo: Algorithm) -> some View {
		NavigationLink(algo.name) {
			if algo.enabled {
				AlgorithmMarkdown(algorithm: algo)
			} else {
				Text("Info about \(algo.name) to be studied")
			}
		}.disabled(!algo.enabled)
		
	}
}



#Preview {
    ContentView()
}

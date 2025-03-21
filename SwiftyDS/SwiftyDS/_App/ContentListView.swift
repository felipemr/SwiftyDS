//
//  ContentView.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 09/10/24.
//

import MarkdownUI
import SwiftUI

struct ContentListView: View {
	
	let algoList = Algorithm.list
	let dsList = DataStructure.list
	
	@State private var showHiddenContent: Bool = false
	
    var body: some View {
		NavigationStack {
			List {
				Section("Algorithms") {
					ForEach(algoList) { algo in
						algoCell(algo)
					}
				}
				Section("Data Structures") {
					ForEach(dsList) { ds in
						dsCell(ds)
					}
				}
			}
			.toolbar {
				ToolbarItem {
					Button("Show hidden", systemImage: showHiddenContent ? "eye.fill" : "eye.slash.fill") {
						withAnimation {
							showHiddenContent.toggle()
						}
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
		if !showHiddenContent && !algo.enabled {
			EmptyView()
		} else {
			NavigationLink(algo.name) {
				AlgorithmContentView(algorithm: algo)
			}
			.disabled(!algo.enabled)
		}
	}
	
	@ViewBuilder
	func dsCell(_ ds: DataStructure) -> some View {
		if !showHiddenContent && !ds.enabled {
			EmptyView()
		} else {
			NavigationLink(ds.name) {
				DSMarkdown(ds: ds)
			}
			.disabled(!ds.enabled)
		}
	}
}



#Preview {
    ContentListView()
}

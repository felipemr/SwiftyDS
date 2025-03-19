//
//  AlgorithmMarkdown.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 19/03/25.
//

import MarkdownUI
import SwiftUI

struct AlgorithmMarkdown: View {
	var algorithm: Algorithm
	var body: some View {
		ScrollView {
			if let content = algorithm.fileContents {
				Markdown(content)
			} else {
				Text("Loading...")
			}
		}
	}
}

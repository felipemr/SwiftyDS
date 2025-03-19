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
					.markdownTheme(.gitHub)
					.markdownTextStyle(\.code) {
					  FontFamilyVariant(.monospaced)
					  FontSize(.em(0.85))
					  ForegroundColor(.purple)
					  BackgroundColor(.purple.opacity(0.25))
					}
			} else {
				Text("Loading...")
			}
		}
		.padding()
	}
}

#Preview {
	AlgorithmMarkdown(algorithm: Algorithm("Preview", fileName: "MarkdownTest"))
}

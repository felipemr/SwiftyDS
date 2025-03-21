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
			Markdown(algorithm.more)
				.markdownImageProvider(.asset)
				.markdownCodeSyntaxHighlighter(SplashCodeSyntaxHighlighter(theme: .midnight(withFont: .init(size: 16))))
				.markdownTheme(.gitHub)
				.markdownTextStyle(\.code) {
				  FontFamilyVariant(.monospaced)
				  FontSize(.em(0.85))
				  ForegroundColor(.purple)
				  BackgroundColor(.purple.opacity(0.25))
				}
				.padding()
		}
	}
}

#Preview {
	AlgorithmMarkdown(algorithm: Algorithm("Preview", fileName: "MarkdownTest"))
}

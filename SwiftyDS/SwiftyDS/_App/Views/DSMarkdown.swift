//
//  DSMarkdown.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 19/03/25.
//

import MarkdownUI
import SwiftUI

struct DSMarkdown: View {
	var ds: DataStructure
	var body: some View {
		ScrollView {
			if let content = ds.fileContents {
				Markdown(content)
					.markdownTheme(.docC)
			} else {
				Text("Loading...")
			}
		}
		.padding()
	}
}

#Preview {
	DSMarkdown(ds: DataStructure("SwiftyDS", fileName: "MarkdownTest"))
}

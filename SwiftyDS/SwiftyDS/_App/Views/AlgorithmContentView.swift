//
//  AlgorithmContentView.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 20/03/25.
//

import MarkdownUI
import SwiftUI

struct AlgorithmContentView: View {
	let algorithm: Algorithm
	
    var body: some View {
		VStack {
			Image(algorithm.coverImage)
				.resizable()
				.scaledToFit()
				.frame(height: 150)
			HStack {
				Text(algorithm.emoji)
				Text(algorithm.name)
			}
			.font(.largeTitle)
			Markdown(algorithm.intro)
				.padding()
				.frame(maxHeight: 250)
			
			NavigationLink {
				AlgorithmMarkdown(algorithm: algorithm)
			} label: {
				Text("More...")
			}

		}
    }
}

#Preview {
	NavigationStack{
		AlgorithmContentView(algorithm: Algorithm.list[0])
	}
}

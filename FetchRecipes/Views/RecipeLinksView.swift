//
//  RecipeLinksView.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import SwiftUI

struct RecipeLinksView: View {
    let source_url: URL?
    let youtube_url: URL?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let source_url = source_url {
                Link("View Source Recipe", destination: source_url)
                    .font(.headline)
                    .foregroundColor(.blue)
            } else {
                Text("No source recipe available.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            if let youtube_url = youtube_url {
                Link("Watch on YouTube", destination: youtube_url)
                    .font(.headline)
                    .foregroundColor(.blue)
            } else {
                Text("No YouTube video available.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.top, 16)
    }
}

#Preview {
    RecipeLinksView(
        source_url: URL(string: "https://eatsparkcity.org/"),
        youtube_url: URL(string: "https://youtube.com/watch?v=kcEJG_PaLSQ")
    )
}

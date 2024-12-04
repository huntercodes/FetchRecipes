//
//  RecipeLinksView.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import SwiftUI

struct RecipeLinksView: View {
    let sourceURL: URL?
    let youtubeURL: URL?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let sourceURL = sourceURL {
                HStack {
                    Image(systemName: "link.circle")
                        .bold()
                    
                    Spacer()
                        .frame(width: 24)
                    
                    Link(destination: sourceURL) {
                        Text("Source to Recipe")
                            .lineLimit(1)
                            .truncationMode(.middle)
                            .foregroundColor(.primary)
                            .font(.headline)
                            .underline()
                    }
                }
            } else {
                Text("No source site available.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            if let youtubeURL = youtubeURL {
                HStack {
                    Image(systemName: "play.rectangle")
                        .foregroundColor(.red)
                        .bold()
                    
                    Spacer()
                        .frame(width: 16)
                    
                    Link(destination: youtubeURL) {
                        Text("Watch on YouTube")
                            .lineLimit(1)
                            .truncationMode(.middle)
                            .foregroundColor(.red)
                            .font(.headline)
                            .underline()
                    }
                }
            } else {
                Text("No YouTube video available.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    RecipeLinksView(
        sourceURL: URL(string: "https://eatsparkcity.org/"),
        youtubeURL: URL(string: "https://youtube.com/watch?v=kcEJG_PaLSQ")
    )
}

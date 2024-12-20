//
//  RecipeDetailsView.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Custom Async Image with Cache Management
                RecipeImageView(imageURL: recipe.photoURLLarge, id: recipe.id.uuidString)

                // Recipe Info
                VStack(alignment: .leading, spacing: 8) {
                    Text(recipe.name)
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Cuisine: \(recipe.cuisine)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // Recipe Links
                RecipeLinksView(sourceURL: recipe.sourceURL, youtubeURL: recipe.youtubeURL)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

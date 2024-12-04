//
//  RecipeRow.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            // Custom Async Image with Cache Management
            CachedAsyncImage(
                url: recipe.photoURLSmall ?? URL(string: "https://via.placeholder.com/150")!,
                placeholder: Image(systemName: "photo"),
                cacheKey: recipe.id.uuidString
            )
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 8))

            // Recipe Info
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

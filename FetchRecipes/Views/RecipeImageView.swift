//
//  RecipeImageView.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import SwiftUI

struct RecipeImageView: View {
    let imageURL: URL?
    let id: String

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        if let imageURL = imageURL {
            CachedAsyncImage(
                url: imageURL,
                placeholder: Image(systemName: "photo"),
                cacheKey: "\(id)-large"
            )
            .frame(height: 300)
            .scaledToFill()
            .clipped()
            .shadow(color: shadowColor, radius: 10, x: 0, y: 5)
        } else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .foregroundColor(.gray)
                .shadow(color: shadowColor, radius: 10, x: 0, y: 5)
        }
    }

    private var shadowColor: Color {
        colorScheme == .dark ? Color.white.opacity(0.2) : Color.black.opacity(0.2)
    }
}

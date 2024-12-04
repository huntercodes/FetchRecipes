//
//  CachedAsyncImage.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import SwiftUI

struct CachedAsyncImage: View {
    let url: URL
    let placeholder: Image
    let cacheKey: String

    @State private var loadedImage: UIImage?

    var body: some View {
        Group {
            if let image = loadedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                placeholder
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .onAppear(perform: loadImage)
            }
        }
    }

    private func loadImage() {
        // Check cache first
        if let cachedImage = ImageCacheManager.shared.getCachedImage(forKey: cacheKey) {
            loadedImage = cachedImage
            return
        }

        // Fetch image asynchronously
        Task {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                ImageCacheManager.shared.cacheImage(image, forKey: cacheKey)
                await MainActor.run {
                    loadedImage = image
                }
            }
        }
    }
}

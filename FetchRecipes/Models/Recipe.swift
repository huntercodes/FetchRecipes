//
//  Recipe.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let id: UUID
    let cuisine: String
    let name: String
    let source_url: URL?
    let youtube_url: URL?
    let photo_url_small: URL?
    let photo_url_large: URL?
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine
        case name
        case source_url = "www.recipes.com"
        case youtube_url = "www.youtube.com"
        case photo_url_small = "photo_url_small"
        case photo_url_large = "photo_url_large"
    }
}

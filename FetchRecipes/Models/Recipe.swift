//
//  Recipe.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import Foundation

struct Recipe: Codable, Identifiable, Hashable {
    let id: UUID
    let cuisine: String
    let name: String
    let photoURLSmall: URL?
    let photoURLLarge: URL?
    let sourceURL: URL?
    let youtubeURL: URL?

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine
        case name
        case photoURLSmall = "photo_url_small"
        case photoURLLarge = "photo_url_large"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}

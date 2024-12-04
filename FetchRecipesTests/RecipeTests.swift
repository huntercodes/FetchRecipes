//
//  RecipeTests.swift
//  FetchRecipesTests
//
//  Created by hunter downey on 12/4/24.
//

import XCTest
@testable import FetchRecipes

final class RecipeTests: XCTestCase {
    func testRecipeDecoding() throws {
        let mockRecipeJSON = """
        {
            "uuid": "123e4567-e89b-12d3-a456-426614174000",
            "cuisine": "Italian",
            "name": "Spaghetti",
            "photo_url_small": "https://example.com/small.jpg",
            "photo_url_large": "https://example.com/large.jpg",
            "source_url": "https://example.com/source",
            "youtube_url": "https://youtube.com/watch?v=example"
        }
        """.data(using: .utf8)!

        let recipe = try JSONDecoder().decode(Recipe.self, from: mockRecipeJSON)
        XCTAssertEqual(recipe.name, "Spaghetti")
        XCTAssertEqual(recipe.cuisine, "Italian")
        XCTAssertEqual(recipe.sourceURL?.absoluteString, "https://example.com/source")
    }
}

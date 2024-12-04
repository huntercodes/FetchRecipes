//
//  RecipeListViewModelTests.swift
//  FetchRecipesTests
//
//  Created by hunter downey on 12/4/24.
//

import XCTest
@testable import FetchRecipes

final class RecipeListViewModelTests: XCTestCase {
    var viewModel: RecipeListViewModel!

    @MainActor override func setUpWithError() throws {
        viewModel = RecipeListViewModel()
        viewModel.recipes = [
            Recipe(
                id: UUID(uuidString: "123e4567-e89b-12d3-a456-426614174000")!,
                cuisine: "Italian",
                name: "Spaghetti",
                photoURLSmall: nil,
                photoURLLarge: nil,
                sourceURL: nil,
                youtubeURL: nil
            ),
            Recipe(
                id: UUID(uuidString: "123e4567-e89b-12d3-a456-426614174001")!,
                cuisine: "French",
                name: "Croissant",
                photoURLSmall: nil,
                photoURLLarge: nil,
                sourceURL: nil,
                youtubeURL: nil
            )
        ]
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    @MainActor func testSortingRecipesByCuisine() {
        viewModel.selectedSortOption = .byCuisine
        let sorted = viewModel.filteredAndSortedRecipes
        XCTAssertEqual(sorted.first?.cuisine, "French")
    }
}

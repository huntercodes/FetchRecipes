//
//  RecipeListViewModel.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import Foundation
import Combine

@MainActor
class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var searchText: String = ""
    @Published var selectedSortOption: SortOption = .alphabetical
    @Published var showingSortOptions: Bool = false

    var filteredAndSortedRecipes: [Recipe] {
        var filtered = recipes

        // Apply search filter
        if !searchText.isEmpty {
            filtered = filtered.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.cuisine.localizedCaseInsensitiveContains(searchText)
            }
        }

        // Sort based on selected option
        switch selectedSortOption {
        case .alphabetical:
            return filtered.sorted { $0.name < $1.name }
        case .byCuisine:
            return filtered.sorted { $0.cuisine < $1.cuisine }
        }
    }

    func loadRecipes() async {
        isLoading = true
        errorMessage = nil

        do {
            let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
            recipes = try await RecipeAPI.shared.fetchRecipes(from: url)
        } catch {
            if let apiError = error as? APIError {
                switch apiError {
                case .malformedData:
                    errorMessage = "The recipe data is malformed. Please try again later."
                case .networkError:
                    errorMessage = "Network error occurred. Please check your connection."
                }
            } else {
                errorMessage = "An unknown error occurred."
            }
        }

        isLoading = false
    }
}

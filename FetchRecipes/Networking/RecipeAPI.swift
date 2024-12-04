//
//  RecipeAPI.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import Foundation

// Swift Concurreny to handle threads switching
class RecipeAPI {
    static let shared = RecipeAPI()
    
    private init() {}
    
    func fetchRecipes(from url: URL) async throws -> [Recipe] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.networkError
        }
        
        let decodedData = try JSONDecoder().decode([String: [Recipe]].self, from: data)
        
        guard let recipes = decodedData["recipes"] else {
            throw APIError.malformedData
        }
        
        return recipes
    }
}

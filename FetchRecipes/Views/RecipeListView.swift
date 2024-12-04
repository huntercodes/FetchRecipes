//
//  RecipeListView.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading Recipes...")
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else if viewModel.recipes.isEmpty {
                    Text("No recipes found.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(viewModel.filteredAndSortedRecipes) { recipe in
                        NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                            RecipeRow(recipe: recipe)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Recipes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingSortOptions = true
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                    .accessibilityLabel("Filter")
                    .sheet(isPresented: $viewModel.showingSortOptions) {
                        SortOptionsView(selectedSortOption: $viewModel.selectedSortOption)
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.loadRecipes()
                }
            }
            .refreshable {
                Task {
                    await viewModel.loadRecipes()
                }
            }
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always)
            )
        }
    }
}

#Preview {
    RecipeListView()
}

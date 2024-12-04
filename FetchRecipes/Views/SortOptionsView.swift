//
//  SortOptionsView.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import SwiftUI

struct SortOptionsView: View {
    @Binding var selectedSortOption: SortOption
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List(SortOption.allCases, id: \.self) { option in
                Button(action: {
                    selectedSortOption = option
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text(option.rawValue)
                        if selectedSortOption == option {
                            Spacer()
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
            .navigationTitle("Sort By")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

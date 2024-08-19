//
//  MealDetailView.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/18/24.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Details
    
    
    var body: some View {
        Text(meal.strMeal)
    }
}

#Preview {
    MealDetailView(meal: mockMealDetails().meals[0])
}

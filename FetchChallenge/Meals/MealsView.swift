//
//  MealsView.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/17/24.
//

import SwiftUI

struct MealsView: View {
    @State var viewModel: MealsViewModelProtocol
    
    var body: some View {
        Group {
            VStack {
                ForEach(viewModel.meals.meals, id: \.self) { meal in
                    MealCellView(meal)
                }
            }
        }
        .task {
            await viewModel.fetchDessert()
        }
    }
    
    @ViewBuilder
    func MealCellView(_ meal: Meal) -> some View {
        VStack {
            Text(meal.strMeal)
        }
    }
}



#Preview {
    MealsView(viewModel: MockMealsViewModel())
}

//
//  ContentView.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MealsView(viewModel: MealsViewModel(mealService: MealService(APIService: APIService())))
    }
}

#Preview {
    ContentView()
}

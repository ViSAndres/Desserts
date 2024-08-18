//
//  MockMealsViewModel.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/18/24.
//

import Foundation

public class MockMealsViewModel: MealsViewModelProtocol {
    var mealService: MealServiceProtocol = MockMealService()
    var meals = Meals(meals: [])
    
    func fetchDessert() async {
        meals = await mealService.fetchMeals(for: .dessert)
    }
    
    
}

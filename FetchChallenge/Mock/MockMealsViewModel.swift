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
    
    private var currentMealDetails: MealDetails?
    
    func fetchDessert() async {
        meals = await mealService.fetchMeals(for: .dessert)
    }
    
    func fetchMealDetails(for mealID: String) async {
        currentMealDetails = await mealService.fetchMealDetails(for: "123")
    }
    
    func getCurrentMealDetails() -> MealDetails {
        return self.currentMealDetails ?? mockMealDetails()
    }
}

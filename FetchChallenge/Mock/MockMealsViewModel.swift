//
//  MockMealsViewModel.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/18/24.
//

import Foundation

public class MockMealsViewModel: MealsViewModelProtocol {
    var error: Error?
    
    var hasError = false
    
    var mealService: MealServiceProtocol = MockMealService()
    var meals = Meals(meals: [])
    
    private var currentMealDetails: MealDetails?
    
    func fetchMeals(for category: MealCategory) async  {
        do {
            meals = try await mealService.fetchMeals(for: .dessert)
        } catch {
            
        }
    }
    
    func fetchMealDetails(for mealID: String) async {
        do {
            currentMealDetails = try await mealService.fetchMealDetails(for: "123")
        } catch {
            
        }
    }
    
    func getCurrentMealDetails() -> MealDetails {
        return self.currentMealDetails ?? mockMealDetails()
    }
}

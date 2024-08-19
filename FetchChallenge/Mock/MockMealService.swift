//
//  MockMealService.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/18/24.
//

import Foundation

class MockMealService: MealServiceProtocol {
    func fetchMeals(for catagory: MealCategory) async -> Meals {
        return mockMeals()
    }
    
    func fetchMealDetails(for id: String) async -> MealDetails {
        return mockMealDetails()
    }
}



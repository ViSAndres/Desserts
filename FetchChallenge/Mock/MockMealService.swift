//
//  MockMealService.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/18/24.
//

import Foundation

class MockMealService: MealServiceProtocol {
    var requestMeals = Meals(meals: [])
    var requestMealDetails = MealDetails(meals: [])
    var requestSuccess: Bool = true
    var reqquestError: NetworkError = NetworkError.apiError
    
    func fetchMeals(for catagory: MealCategory) async throws -> Meals {
        
        if requestSuccess {
            return requestMeals
        }
        
        throw reqquestError
    }
    
    func fetchMealDetails(for id: String) async throws -> MealDetails {
        if requestSuccess {
            return requestMealDetails
        }
        
        throw reqquestError
    }
}



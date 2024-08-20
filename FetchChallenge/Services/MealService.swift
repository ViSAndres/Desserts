//
//  MealService.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/17/24.
//

import Foundation

protocol MealServiceProtocol {
    func fetchMeals(for catagory: MealCategory) async throws -> Meals
    func fetchMealDetails(for id: String) async throws -> MealDetails
}

enum MealCategory: String {
    case dessert = "Dessert"
}

class MealService: MealServiceProtocol {
    private let APIService: APIService
    
    init(APIService: APIService) {
        self.APIService = APIService
    }
    
    func fetchMeals(for catagory: MealCategory) async throws -> Meals {
        var meals = Meals(meals: [])
        guard let url: URL = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(catagory.rawValue)") else { return meals }
        
        let data = try await APIService.performDataRequest(for: url)
        meals = try JSONDecoder().decode(Meals.self, from: data)
        
        return meals
    }
    
    func fetchMealDetails(for id: String) async throws -> MealDetails {
        var mealDetail = MealDetails(meals: [])
        
        guard let url: URL = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else { return mealDetail }
        
        let data = try await APIService.performDataRequest(for: url)
        mealDetail = try JSONDecoder().decode(MealDetails.self, from: data)
        
        return mealDetail
    }
}

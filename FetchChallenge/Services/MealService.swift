//
//  MealService.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/17/24.
//

import Foundation

protocol MealServiceProtocol {
    func fetchMeals(for catagory: MealCategory) async -> Meals
    func fetchMealDetails(for id: String) async -> MealDetail
}

enum MealCategory: String {
    case dessert = "Dessert"
}

class MealService: MealServiceProtocol {
    private let APIService: APIServiceProtocol
    
    init(APIService: APIServiceProtocol) {
        self.APIService = APIService
    }
    
    func fetchMeals(for catagory: MealCategory) async -> Meals {
        var meals = Meals(meals: [])
        guard let url: URL = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(catagory.rawValue)") else { return meals }
        
        do {
            let data = try await APIService.performDataRequest(for: url)
            meals = try JSONDecoder().decode(Meals.self, from: data)
        } catch let error {
            // TODO: Handle error
            print(error)
        }
        
        return meals
    }
    
    func fetchMealDetails(for id: String) async -> MealDetail {
        var mealDetail = MealDetail(meals: [])
        
        guard let url: URL = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else { return mealDetail }
        
        do {
            let data = try await APIService.performDataRequest(for: url)
            mealDetail = try JSONDecoder().decode(MealDetail.self, from: data)
        } catch let error {
            // TODO: Handle error
        }
        
        return mealDetail
    }
}

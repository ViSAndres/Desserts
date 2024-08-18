//
//  MealService.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/17/24.
//

import Foundation

class MealService {
    private let APIService: APIServiceProtocol
    
    init(APIService: APIServiceProtocol) {
        self.APIService = APIService
    }
    
    func fetchDesserts() async -> Meals {
        var meals = Meals(meals: [])
        guard let url: URL = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { return meals }
        
        do {
            let data = try await APIService.performDataRequest(for: url)
            meals = try JSONDecoder().decode(Meals.self, from: data)
        } catch let error {
            // TODO: Handle error
        }
        
        return meals
    }
}

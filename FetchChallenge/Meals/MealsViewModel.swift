//
//  MealsViewModel.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/17/24.
//

import Foundation

protocol MealsViewModelProtocol {
    var mealService: MealServiceProtocol { get }
    var meals: Meals { get set }
    
    func fetchDessert() async
}

@Observable
class MealsViewModel: MealsViewModelProtocol {
    let mealService: MealServiceProtocol
    var meals: Meals
    
    init(mealService: MealServiceProtocol, meals: Meals = Meals(meals: [])) {
        self.mealService = mealService
        self.meals = meals
    }
    
    func fetchDessert() async {
        meals = await mealService.fetchMeals(for: .dessert)
    }
}

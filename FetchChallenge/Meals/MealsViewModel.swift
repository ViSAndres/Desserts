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
    var error: Error? { get }
    var hasError: Bool { get set }
    
    func fetchMeals(for category: MealCategory) async 
    func fetchMealDetails(for mealID: String) async
    func getCurrentMealDetails() -> MealDetails?
}

@Observable
class MealsViewModel: MealsViewModelProtocol {
    let mealService: MealServiceProtocol
    var meals: Meals
    var error: Error?
    
    var hasError: Bool = false
    
    private var currentMealDetails: MealDetails?
    
    init(mealService: MealServiceProtocol, meals: Meals = Meals(meals: [])) {
        self.mealService = mealService
        self.meals = meals
    }
    
    func fetchMeals(for category: MealCategory) async {
        do {
            meals = try await mealService.fetchMeals(for: category)
        } catch {
            self.error = error
            hasError = true
        }
    }
    
    func fetchMealDetails(for mealID: String) async {
        do {
            currentMealDetails = try await mealService.fetchMealDetails(for: mealID)
        } catch {
            self.error = error
            hasError = true
        }
    }
    
    func getCurrentMealDetails() -> MealDetails? {
        return self.currentMealDetails
    }
}

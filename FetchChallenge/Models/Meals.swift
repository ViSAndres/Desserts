//
//  Meals.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/17/24.
//

import Foundation

public struct Meals: Codable {
    let meals : [Meal]
}

struct Meal: Codable, Hashable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

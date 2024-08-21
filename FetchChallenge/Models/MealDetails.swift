//
//  MealDetail.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/18/24.
//

import Foundation

public struct MealDetails: Codable {
    let meals: [Details]
}

public struct Details: Codable, Hashable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    func getIngredients() -> [String: String] {
        var ingredients: [String: String] = [:]
        
        if let strIngredient1 = strIngredient1 { ingredients[strIngredient1] = strMeasure1 ?? "" }
        if let strIngredient2 = strIngredient2 { ingredients[strIngredient2] = strMeasure2 ?? "" }
        if let strIngredient3 = strIngredient3 { ingredients[strIngredient3] = strMeasure3 ?? "" }
        if let strIngredient4 = strIngredient4 { ingredients[strIngredient4] = strMeasure4 ?? "" }
        if let strIngredient5 = strIngredient5 { ingredients[strIngredient5] = strMeasure5 ?? "" }
        if let strIngredient6 = strIngredient6 { ingredients[strIngredient6] = strMeasure6 ?? "" }
        if let strIngredient7 = strIngredient7 { ingredients[strIngredient7] = strMeasure7 ?? "" }
        if let strIngredient8 = strIngredient8 { ingredients[strIngredient8] = strMeasure8 ?? "" }
        if let strIngredient9 = strIngredient9 { ingredients[strIngredient9] = strMeasure9 ?? "" }
        if let strIngredient10 = strIngredient10 { ingredients[strIngredient10] = strMeasure10 ?? "" }
        if let strIngredient11 = strIngredient11 { ingredients[strIngredient11] = strMeasure11 ?? "" }
        if let strIngredient12 = strIngredient12 { ingredients[strIngredient12] = strMeasure12 ?? "" }
        if let strIngredient13 = strIngredient13 { ingredients[strIngredient13] = strMeasure13 ?? "" }
        if let strIngredient14 = strIngredient14 { ingredients[strIngredient14] = strMeasure14 ?? "" }
        if let strIngredient15 = strIngredient15 { ingredients[strIngredient15] = strMeasure15 ?? "" }
        if let strIngredient16 = strIngredient16 { ingredients[strIngredient16] = strMeasure16 ?? "" }
        if let strIngredient17 = strIngredient17 { ingredients[strIngredient17] = strMeasure17 ?? "" }
        if let strIngredient18 = strIngredient18 { ingredients[strIngredient18] = strMeasure18 ?? "" }
        if let strIngredient19 = strIngredient19 { ingredients[strIngredient19] = strMeasure19 ?? "" }
        if let strIngredient20 = strIngredient20 { ingredients[strIngredient20] = strMeasure20 ?? "" }
        
        return ingredients
    }
    
    func getYouTubeEmbed() -> URL? {
        guard let strYoutube = strYoutube, let pre = strYoutube.firstIndex(of: "=") else { return nil }
        
        let videoId = String(strYoutube[strYoutube.index(after: pre)...])
        let urlStr = "https://www.youtube.com/embed/\(videoId)"
        
        return URL(string: urlStr)
    }
    
    func getTags() -> [Substring]? {
        guard let strTags = strTags else { return nil }
        let arr = strTags.split(separator: ",")
        return arr
    }
}

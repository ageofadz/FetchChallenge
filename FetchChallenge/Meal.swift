// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mealResponse = try? JSONDecoder().decode(MealResponse.self, from: jsonData)

import Foundation

// MARK: - MealResponse
struct MealResponse: Codable {
    let meals: [Meal]?
}

// MARK: - Meal
struct Meal: Codable  {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    let strDrinkAlternate: String?
    let strCategory, strArea, strInstructions: String?
    let strTags:  String?
    let strYoutube: String?
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20: String?
    let strSource: String?
    let strImageSource, strCreativeCommonsConfirmed, dateModified:  String?
    
    func getIngredientsList() -> [String] {
        return [strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20].compactMap({ $0 }).filter{ !$0.isEmpty }
    }
    
    func getMeasurementsList() -> [String] {
        return [strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20].compactMap({ $0 }).filter{ !$0.isEmpty }
    }
}

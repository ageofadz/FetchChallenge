import Foundation
class ViewModel: ObservableObject {
    @Published private(set) var meals: [Meal]?
    @Published private(set) var meal: Meal?
    
    func fetchMeals() async {
        do {
            guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { fatalError("Missing URL") }
            
            let urlRequest = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(MealResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.meals = decodedData.meals?.sorted(by: { $0.strMeal < $1.strMeal })
            }
            
        } catch {
            print("Error fetching data from API: \(error)")
        }
    }
    
    func fetchMeal(_ mealid: String) async {
        do {
            guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealid)") else { fatalError("Missing URL") }
            
            let urlRequest = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(MealResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.meal = decodedData.meals?[0]
            }
            
        } catch {
            print("Error fetching data from API: \(error)")
        }
    }
}

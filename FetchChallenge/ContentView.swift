//
//  ContentView.swift
//  FetchChallenge
//
//  Created by Sam Robertson on 6/6/23.
//

import SwiftUI


struct DetailView: View {
    let recipeID: String
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        if let meal = viewModel.meal {
            VStack {
                Text(meal.strMeal).font(.title)
                    .padding(.bottom)
                
                HStack {
                    List(Array(zip(meal.getIngredientsList(), meal.getMeasurementsList())), id: \.0) { pair in
                        Text("\(pair.1) \(pair.0)")
                    }
                }
                
                .padding(.bottom)
                
                ScrollView {
                    Text(meal.strInstructions ?? "").font(.body).multilineTextAlignment(.leading)
                        .lineLimit(nil)
                }
                .padding(.horizontal)
            }
        } else {
            Text("Loading...")
                .onAppear {
                    Task {
                        await viewModel.fetchMeal(recipeID)
                    }
                }
        }
    }
    
}


struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        if let meals = viewModel.meals {
            NavigationView {
                List(meals, id: \.idMeal) { meal in
                    NavigationLink {
                        DetailView(recipeID: meal.idMeal)
                    } label: {
                        Text(meal.strMeal)
                    }
                }
                .refreshable {
                    await viewModel.fetchMeals()
                }
                .navigationTitle("Desserts")
            }
        } else {
            Text("Loading...")
                .onAppear {
                    Task {
                        await viewModel.fetchMeals()
                    }
                }
        }
    }
} 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

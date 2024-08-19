//
//  MealDetailView.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/18/24.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Details
    
    
    var body: some View {
        Group {
            ScrollView {
                VStack(spacing: 0) {
                    HeaderView()
                    
                    BodyView()
                }
            }
            .background(.gray)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 0.12941176470588237, green: 0.16862745098039217, blue: 0.16470588235294117), lineWidth: 1)
            )
            .padding(.horizontal, 20)
        }
        // TODO: Add colors to xcode
        .background(Color(red: 0.12941176470588237, green: 0.16862745098039217, blue: 0.16470588235294117))
//        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
            VStack {
                ImageView()
                
                Text(meal.strMeal)
                    .font(.title)
            }
    }
    
    
    
    @ViewBuilder
    func ImageView() -> some View {
        let urlStr = meal.strMealThumb ?? "No URL"
        
        AsyncImage(url: URL(string: urlStr)) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "carrot")
        }
        .frame(maxWidth: .infinity, maxHeight: 300, alignment: .topLeading)
    }
    
    @ViewBuilder
    func BodyView() -> some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .font(.title2)
            
            Text(meal.strInstructions ?? "Idk just cook it")
            
            IngredientsView()
        }
        .padding()
    }
    
    @ViewBuilder
    func IngredientsView() -> some View {
        let ingredients = meal.getIngredients()
        
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.title2)
            
            ForEach(ingredients.keys.sorted(), id: \.self) { key in
                if let measurement = ingredients[key] {
                    if key != "" {
                        if measurement != " " {
                            Text("\(measurement) of \(key)")
                        } else { Text(key) }
                    }
                }
            }
        }
        .padding(.top, 10)
    }
}

#Preview {
    MealDetailView(meal: mockMealDetails().meals[0])
}

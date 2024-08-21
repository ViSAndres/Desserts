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
            .background(.white)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("LightGray", bundle: .main), lineWidth: 1)
            )
            .padding(.horizontal, 20)
        }
        .background(Color("LightGray", bundle: .main))
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
    func BodyView() -> some View {
        VStack(alignment: .leading) {
            TagsView()
            
            IngredientsView()
            
            InstructionsView()
            
            MediaView()
        }
        .padding()
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
    func TagsView() -> some View {
        if let tags = meal.getTags() {
            let rows = [GridItem(.fixed(30))]
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(tags, id: \.self) {tag in
                            Text(tag)
                            .padding(.all, 7)
                            .background(
                                    Capsule()
                                        .strokeBorder(Color.gray,lineWidth: 0.8)
                                        .background(.lightGray)
                                        .clipped()
                                )
                                .clipShape(Capsule())
                    }
                }
            }
        }
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
                            Text("\(key): \(measurement)")
                        } else { Text(key) }
                    }
                }
            }
        }
        .padding(.vertical, 5)
    }
    
    @ViewBuilder
    func InstructionsView() -> some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .font(.title2)
            
            if let instructions = meal.strInstructions {
                Text(instructions)
            }
            
        }
    }
    
    @ViewBuilder
    func MediaView() -> some View {
        if let url = meal.getYouTubeEmbed() {
            YouTubeView(url: url)
                .frame(width: 300, height: 200)
                .padding()
        }
    }
}

#Preview {
    MealDetailView(meal: mockMealDetails().meals[0])
}
